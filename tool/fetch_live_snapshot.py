#!/usr/bin/env python3
"""Fetch delayed public macro series and write live_snapshot.json for Macro Pulse."""

from __future__ import annotations

import json
import math
import urllib.request
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
OUT_PATHS = [
    ROOT / "assets" / "data" / "live_snapshot.json",
    ROOT / "web" / "data" / "live_snapshot.json",
]

UA = {"User-Agent": "Mozilla/5.0 MacroPulseFetcher/1.0", "Accept": "*/*"}


def _get_bytes(url: str) -> bytes:
    req = urllib.request.Request(url, headers=UA)
    with urllib.request.urlopen(req, timeout=30) as resp:
        return resp.read()


def get_json(url: str):
    return json.loads(_get_bytes(url).decode("utf-8"))


def get_text(url: str) -> str:
    return _get_bytes(url).decode("utf-8", errors="replace")


def yahoo_chart(symbol: str) -> dict:
    enc = urllib.request.quote(symbol, safe="")
    url = (
        f"https://query1.finance.yahoo.com/v8/finance/chart/{enc}"
        f"?interval=1d&range=15d"
    )
    data = get_json(url)
    result = data["chart"]["result"][0]
    closes = result["indicators"]["quote"][0]["close"]
    stamps = result["timestamp"]
    pairs = [
        (datetime.fromtimestamp(ts, tz=timezone.utc).date().isoformat(), float(c))
        for ts, c in zip(stamps, closes)
        if c is not None and not math.isnan(c)
    ]
    if len(pairs) < 2:
        raise RuntimeError(f"Not enough Yahoo bars for {symbol}")
    last_date, last = pairs[-1]
    prev = pairs[-2][1]
    chg_pct = ((last / prev) - 1.0) * 100.0 if prev else 0.0
    return {
        "symbol": symbol,
        "value": round(last, 4),
        "prev": round(prev, 4),
        "chgPct1d": round(chg_pct, 2),
        "asOf": last_date,
    }


def fred_csv(series_id: str) -> list[tuple[str, float]]:
    txt = get_text(f"https://fred.stlouisfed.org/graph/fredgraph.csv?id={series_id}")
    rows: list[tuple[str, float]] = []
    for line in txt.strip().splitlines()[1:]:
        parts = line.split(",")
        if len(parts) < 2:
            continue
        date, raw = parts[0].strip(), parts[1].strip()
        if not raw or raw == ".":
            continue
        try:
            rows.append((date, float(raw)))
        except ValueError:
            continue
    if not rows:
        raise RuntimeError(f"Empty FRED series {series_id}")
    return rows


def cpi_yoy() -> dict:
    rows = fred_csv("CPIAUCSL")
    latest_date, latest = rows[-1]
    # Prefer same calendar month one year earlier.
    year, month, *_ = latest_date.split("-")
    target = f"{int(year) - 1}-{month}"
    year_ago = None
    year_ago_date = None
    for date, value in reversed(rows):
        if date.startswith(target):
            year_ago = value
            year_ago_date = date
            break
    if year_ago is None:
        # Fallback: 12 observations back.
        year_ago_date, year_ago = rows[-13]
    yoy = ((latest / year_ago) - 1.0) * 100.0
    return {
        "metric": "CPIAUCSL_YoY",
        "value": round(yoy, 2),
        "index": round(latest, 3),
        "period": latest_date[:7],
        "vsPeriod": year_ago_date[:7] if year_ago_date else None,
        "asOf": latest_date,
        "source": "FRED CPIAUCSL",
    }


def latest_fred(series_id: str, metric: str) -> dict:
    rows = fred_csv(series_id)
    date, value = rows[-1]
    prev = rows[-2][1] if len(rows) > 1 else value
    return {
        "metric": metric,
        "value": round(value, 4),
        "prev": round(prev, 4),
        "asOf": date,
        "source": f"FRED {series_id}",
    }


def mood_label(vix: float) -> str:
    if vix < 15:
        return "calm"
    if vix < 20:
        return "normal"
    if vix < 30:
        return "elevated"
    return "stressed"


def build_snapshot() -> dict:
    rates = latest_fred("DFF", "EFFR")
    tnx = yahoo_chart("^TNX")
    inflation = cpi_yoy()
    be = latest_fred("T5YIE", "T5YIE")
    dollar = yahoo_chart("DX-Y.NYB")
    vix = yahoo_chart("^VIX")
    spx = yahoo_chart("^GSPC")
    fx = get_json("https://api.frankfurter.app/latest?from=USD&to=EUR,BRL,MXN")

    as_of = max(
        rates["asOf"],
        inflation["asOf"],
        dollar["asOf"],
        vix["asOf"],
        spx["asOf"],
    )

    return {
        "schema": 1,
        "asOf": as_of,
        "fetchedAt": datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ"),
        "stamp": "WEB · r4",
        "disclaimer": (
            "Delayed public educational snapshot. Not a trading terminal. "
            "Not financial advice."
        ),
        "sources": [
            "FRED CPIAUCSL",
            "FRED DFF",
            "FRED T5YIE",
            "Yahoo Finance charts (^TNX, DX-Y.NYB, ^VIX, ^GSPC)",
            "Frankfurter EUR/BRL/MXN",
        ],
        "rates": {
            **rates,
            "us10y": tnx["value"],
            "us10yAsOf": tnx["asOf"],
            "us10yChgPct1d": tnx["chgPct1d"],
        },
        "inflation": {
            **inflation,
            "breakeven5y": be["value"],
            "breakevenAsOf": be["asOf"],
        },
        "dollar": {
            "metric": "DXY_proxy",
            "value": dollar["value"],
            "chgPct1d": dollar["chgPct1d"],
            "asOf": dollar["asOf"],
            "source": "Yahoo DX-Y.NYB",
            "fx": {
                "date": fx.get("date"),
                "EUR": fx.get("rates", {}).get("EUR"),
                "BRL": fx.get("rates", {}).get("BRL"),
                "MXN": fx.get("rates", {}).get("MXN"),
            },
        },
        "mood": {
            "metric": "VIX",
            "value": vix["value"],
            "chgPct1d": vix["chgPct1d"],
            "asOf": vix["asOf"],
            "regime": mood_label(vix["value"]),
            "source": "Yahoo ^VIX",
        },
        "equities": {
            "metric": "SPX",
            "value": spx["value"],
            "chgPct1d": spx["chgPct1d"],
            "asOf": spx["asOf"],
            "source": "Yahoo ^GSPC",
        },
    }


def main() -> None:
    snap = build_snapshot()
    text = json.dumps(snap, ensure_ascii=False, indent=2) + "\n"
    for path in OUT_PATHS:
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(text, encoding="utf-8")
        print("wrote", path)
    print("asOf", snap["asOf"])
    print(
        "EFFR",
        snap["rates"]["value"],
        "CPI YoY",
        snap["inflation"]["value"],
        "DXY",
        snap["dollar"]["value"],
        "VIX",
        snap["mood"]["value"],
        "SPX",
        snap["equities"]["value"],
    )


if __name__ == "__main__":
    main()

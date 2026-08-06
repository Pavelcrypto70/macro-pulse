import json
import urllib.request


def get_json(url):
    req = urllib.request.Request(
        url,
        headers={
            "User-Agent": "Mozilla/5.0 MacroPulse/1.0",
            "Accept": "application/json",
        },
    )
    with urllib.request.urlopen(req, timeout=25) as r:
        return json.load(r)


def get_text(url):
    req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0 MacroPulse/1.0"})
    with urllib.request.urlopen(req, timeout=25) as r:
        return r.read().decode("utf-8", errors="replace")


# World Bank inflation
try:
    d = get_json(
        "https://api.worldbank.org/v2/country/US/indicator/FP.CPI.TOTL.ZG?format=json&per_page=5"
    )
    print("WB", d[1][:3] if isinstance(d, list) and len(d) > 1 else d)
except Exception as e:
    print("WB ERR", e)

# FRED CSV without key
for series in ["CPIAUCSL", "T5YIE", "DFF"]:
    try:
        txt = get_text(f"https://fred.stlouisfed.org/graph/fredgraph.csv?id={series}")
        lines = [ln for ln in txt.strip().splitlines() if ln and not ln.startswith("DATE")]
        print("FRED", series, lines[-3:])
    except Exception as e:
        print("FRED", series, "ERR", e)

# Yahoo T5YIE breakeven
try:
    d = get_json(
        "https://query1.finance.yahoo.com/v8/finance/chart/T5YIE?interval=1d&range=5d"
    )
    m = d["chart"]["result"][0]["meta"]
    print("T5YIE", m.get("regularMarketPrice"), m.get("chartPreviousClose"))
except Exception as e:
    print("T5YIE ERR", e)

# Full GSPC closes
try:
    d = get_json(
        "https://query1.finance.yahoo.com/v8/finance/chart/%5EGSPC?interval=1d&range=10d"
    )
    r = d["chart"]["result"][0]
    closes = r["indicators"]["quote"][0]["close"]
    ts = r["timestamp"]
    print("GSPC closes", list(zip(ts[-5:], closes[-5:])))
    print("meta", r["meta"].get("regularMarketPrice"), r["meta"].get("chartPreviousClose"))
except Exception as e:
    print("GSPC ERR", e)

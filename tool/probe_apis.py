import json
import urllib.request


def get(url, data=None, headers=None):
    h = {
        "User-Agent": "Mozilla/5.0 MacroPulse/1.0",
        "Accept": "application/json",
    }
    if headers:
        h.update(headers)
    req = urllib.request.Request(url, data=data, headers=h)
    with urllib.request.urlopen(req, timeout=25) as r:
        return json.load(r)


for sym in ["%5ETNX", "DX-Y.NYB", "%5EGSPC", "%5EVIX"]:
    try:
        d = get(
            f"https://query1.finance.yahoo.com/v8/finance/chart/{sym}?interval=1d&range=5d"
        )
        m = d["chart"]["result"][0]["meta"]
        print(
            sym,
            m.get("symbol"),
            m.get("regularMarketPrice"),
            m.get("chartPreviousClose"),
        )
    except Exception as e:
        print(sym, "ERR", e)

try:
    d = get("https://api.frankfurter.app/latest?from=USD&to=EUR,BRL,MXN")
    print("FX", d)
except Exception as e:
    print("FX ERR", e)

try:
    d = get("https://api.alternative.me/fng/?limit=2&format=json")
    print("FNG", d["data"][:2])
except Exception as e:
    print("FNG ERR", e)

try:
    body = json.dumps(
        {
            "seriesid": ["CUUR0000SA0"],
            "startyear": "2024",
            "endyear": "2026",
        }
    ).encode()
    d = get(
        "https://api.bls.gov/publicAPI/v2/timeseries/data/",
        data=body,
        headers={"Content-Type": "application/json"},
    )
    print("BLS2", d.get("status"), d.get("message"))
    series = d.get("Results", {}).get("series", [])
    if series:
        print("BLS2 data", series[0].get("data", [])[:4])
except Exception as e:
    print("BLS2 ERR", e)

try:
    d = get("https://api.bls.gov/publicAPI/v1/timeseries/data/CUUR0000SA0")
    print("BLS1", d.get("status"), d.get("message"))
except Exception as e:
    print("BLS1 ERR", e)

try:
    req = urllib.request.Request(
        "https://stooq.com/q/l/?s=^spx&f=sd2t2ohlcv&h&e=csv",
        headers={"User-Agent": "Mozilla/5.0"},
    )
    print("STOOQ", urllib.request.urlopen(req, timeout=20).read()[:200])
except Exception as e:
    print("STOOQ ERR", e)

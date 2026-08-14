# Play Data safety — Macro Pulse

Use this in Play Console → App content → Data safety.

## Collected
- App activity / language preference — **on device** (SharedPreferences)
- Optional: local analytics events (e.g. community button tap) — **on device**, not sold
Local language and legal acceptance. Delayed public macro series (FRED/Yahoo/FX) fetched over the network; bundled snapshot as fallback. No accounts, no IAP. Telegram only if you tap Desk Club.

## Shared
- None sold
- Telegram: user leaves the app if they tap Desk Club (external)
- Market data APIs: requests for public candles/series (not user identity)

## Security
- Data encrypted in transit (HTTPS) for network calls
- Users can reset language / legal acceptance in Profile
- Account deletion: not applicable unless the user later enables cloud league (Paper League only)

## Financial
This app does **not** process payments. Not a broker. Educational / simulation.

## Children
Not directed at children.

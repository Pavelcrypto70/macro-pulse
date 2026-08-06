import '../models/models.dart';
import 'live_snapshot.dart';

LocalizedText _lt(String en, String ru, String es, String pt) =>
    LocalizedText(en: en, ru: ru, es: es, pt: pt);

String _pct(double v, {int digits = 2}) => v.toStringAsFixed(digits);
String _num(double v, {int digits = 2}) {
  if (v.abs() >= 1000) return v.toStringAsFixed(0);
  return v.toStringAsFixed(digits);
}

String _signedPct(double? v) {
  if (v == null) return '—';
  final sign = v > 0 ? '+' : '';
  return '$sign${_pct(v)}%';
}

LocalizedText valueLabelFor(PulseCardKind kind, LiveSnapshot snap) {
  switch (kind) {
    case PulseCardKind.rates:
      final effr = snap.rates.value ?? 0;
      final y10 = snap.rates.numField('us10y') ?? 0;
      return _lt(
        'Fed funds ${_pct(effr)}% · US10Y ${_pct(y10)}%',
        'Ставка ФРС ${_pct(effr)}% · US10Y ${_pct(y10)}%',
        'Fed funds ${_pct(effr)}% · US10Y ${_pct(y10)}%',
        'Fed funds ${_pct(effr)}% · US10Y ${_pct(y10)}%',
      );
    case PulseCardKind.inflation:
      final yoy = snap.inflation.value ?? 0;
      final be = snap.inflation.numField('breakeven5y');
      final period = snap.inflation.strField('period') ?? snap.inflation.asOf;
      final beBit = be == null ? '' : ' · 5Y BE ${_pct(be)}%';
      return _lt(
        'CPI YoY ${_pct(yoy)}% ($period)$beBit',
        'ИПЦ г/г ${_pct(yoy)}% ($period)$beBit',
        'IPC interanual ${_pct(yoy)}% ($period)$beBit',
        'IPC a/a ${_pct(yoy)}% ($period)$beBit',
      );
    case PulseCardKind.dollar:
      final dxy = snap.dollar.value ?? 0;
      final chg = _signedPct(snap.dollar.chgPct1d);
      return _lt(
        'DXY ${_pct(dxy, digits: 2)} · day $chg',
        'DXY ${_pct(dxy, digits: 2)} · день $chg',
        'DXY ${_pct(dxy, digits: 2)} · día $chg',
        'DXY ${_pct(dxy, digits: 2)} · dia $chg',
      );
    case PulseCardKind.mood:
      final vix = snap.mood.value ?? 0;
      final regime = snap.mood.strField('regime') ?? 'normal';
      final label = switch (regime) {
        'calm' => _lt('calm', 'спокойно', 'calmo', 'calmo'),
        'elevated' => _lt('elevated', 'повышенная', 'elevada', 'elevada'),
        'stressed' => _lt('stressed', 'стресс', 'estrés', 'estresse'),
        _ => _lt('normal', 'норма', 'normal', 'normal'),
      };
      return _lt(
        'VIX ${_pct(vix, digits: 2)} · ${label.en} vol',
        'VIX ${_pct(vix, digits: 2)} · ${label.ru} волатильность',
        'VIX ${_pct(vix, digits: 2)} · vol ${label.es}',
        'VIX ${_pct(vix, digits: 2)} · vol ${label.pt}',
      );
    case PulseCardKind.equities:
      final spx = snap.equities.value ?? 0;
      final chg = _signedPct(snap.equities.chgPct1d);
      return _lt(
        'S&P 500 ${_num(spx, digits: 0)} · day $chg',
        'S&P 500 ${_num(spx, digits: 0)} · день $chg',
        'S&P 500 ${_num(spx, digits: 0)} · día $chg',
        'S&P 500 ${_num(spx, digits: 0)} · dia $chg',
      );
  }
}

LocalizedText summaryFor(LiveSnapshot snap) {
  final r = snap.rates.value;
  final i = snap.inflation.value;
  final d = snap.dollar.value;
  final v = snap.mood.value;
  final s = snap.equities.chgPct1d;
  return _lt(
    'EFFR ${r == null ? "—" : "${_pct(r)}%"} · CPI ${_pct(i ?? 0)}% · '
    'DXY ${_pct(d ?? 0)} · VIX ${_pct(v ?? 0)} · S&P day ${_signedPct(s)}.',
    'ФРС ${r == null ? "—" : "${_pct(r)}%"} · ИПЦ ${_pct(i ?? 0)}% · '
    'DXY ${_pct(d ?? 0)} · VIX ${_pct(v ?? 0)} · S&P день ${_signedPct(s)}.',
    'EFFR ${r == null ? "—" : "${_pct(r)}%"} · IPC ${_pct(i ?? 0)}% · '
    'DXY ${_pct(d ?? 0)} · VIX ${_pct(v ?? 0)} · S&P día ${_signedPct(s)}.',
    'EFFR ${r == null ? "—" : "${_pct(r)}%"} · IPC ${_pct(i ?? 0)}% · '
    'DXY ${_pct(d ?? 0)} · VIX ${_pct(v ?? 0)} · S&P dia ${_signedPct(s)}.',
  );
}

PulseCard mergeCard(PulseCard base, LiveSnapshot snap) {
  return PulseCard(
    kind: base.kind,
    headline: base.headline,
    valueLabel: valueLabelFor(base.kind, snap),
    plainMeaning: base.plainMeaning,
    forEquities: base.forEquities,
    whyItMatters: base.whyItMatters,
    commonMistake: base.commonMistake,
    glossaryIds: base.glossaryIds,
  );
}

PulseDay mergeLiveDay(PulseDay template, LiveSnapshot snap) {
  return PulseDay(
    dateIso: snap.asOf,
    summary: summaryFor(snap),
    cards: template.cards.map((c) => mergeCard(c, snap)).toList(),
  );
}

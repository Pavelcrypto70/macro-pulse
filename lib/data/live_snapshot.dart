import '../models/models.dart';

/// Parsed delayed public macro snapshot (educational, not a terminal).
class LiveSnapshot {
  const LiveSnapshot({
    required this.asOf,
    required this.fetchedAt,
    required this.stamp,
    required this.rates,
    required this.inflation,
    required this.dollar,
    required this.mood,
    required this.equities,
    required this.sources,
  });

  final String asOf;
  final String fetchedAt;
  final String stamp;
  final LiveMetric rates;
  final LiveMetric inflation;
  final LiveMetric dollar;
  final LiveMetric mood;
  final LiveMetric equities;
  final List<String> sources;

  factory LiveSnapshot.fromJson(Map<String, dynamic> json) {
    return LiveSnapshot(
      asOf: json['asOf'] as String? ?? '',
      fetchedAt: json['fetchedAt'] as String? ?? '',
      stamp: json['stamp'] as String? ?? 'WEB · r8',
      rates: LiveMetric.fromJson(json['rates'] as Map<String, dynamic>? ?? const {}),
      inflation: LiveMetric.fromJson(
        json['inflation'] as Map<String, dynamic>? ?? const {},
      ),
      dollar: LiveMetric.fromJson(json['dollar'] as Map<String, dynamic>? ?? const {}),
      mood: LiveMetric.fromJson(json['mood'] as Map<String, dynamic>? ?? const {}),
      equities: LiveMetric.fromJson(
        json['equities'] as Map<String, dynamic>? ?? const {},
      ),
      sources: (json['sources'] as List<dynamic>? ?? const [])
          .map((e) => e.toString())
          .toList(),
    );
  }

  LiveMetric metricFor(PulseCardKind kind) => switch (kind) {
        PulseCardKind.rates => rates,
        PulseCardKind.inflation => inflation,
        PulseCardKind.dollar => dollar,
        PulseCardKind.mood => mood,
        PulseCardKind.equities => equities,
      };
}

class LiveMetric {
  const LiveMetric({
    required this.metric,
    required this.value,
    required this.asOf,
    this.chgPct1d,
    this.extra = const {},
  });

  final String metric;
  final double? value;
  final String asOf;
  final double? chgPct1d;
  final Map<String, dynamic> extra;

  factory LiveMetric.fromJson(Map<String, dynamic> json) {
    return LiveMetric(
      metric: json['metric'] as String? ?? '',
      value: (json['value'] as num?)?.toDouble(),
      asOf: json['asOf'] as String? ?? '',
      chgPct1d: (json['chgPct1d'] as num?)?.toDouble(),
      extra: Map<String, dynamic>.from(json),
    );
  }

  double? numField(String key) => (extra[key] as num?)?.toDouble();
  String? strField(String key) => extra[key]?.toString();
}

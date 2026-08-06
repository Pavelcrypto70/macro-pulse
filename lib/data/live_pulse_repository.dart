import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'live_snapshot.dart';
import 'pulse_merge.dart';
import '../models/models.dart';
import 'pulse_catalog.dart';

enum PulseDataOrigin { liveNetwork, liveAsset, liveCache, curatedFallback }

class PulseData {
  const PulseData({
    required this.today,
    required this.days,
    required this.origin,
    required this.stamp,
    this.live,
    this.error,
  });

  final PulseDay today;
  final List<PulseDay> days;
  final PulseDataOrigin origin;
  final String stamp;
  final LiveSnapshot? live;
  final String? error;

  bool get isLive => live != null && origin != PulseDataOrigin.curatedFallback;
}

/// Loads delayed public snapshot: network → cache → asset → curated catalog.
class LivePulseRepository {
  LivePulseRepository({http.Client? client}) : _client = client ?? http.Client();

  static const _cacheKey = 'live_snapshot_json_v1';
  static const assetPath = 'assets/data/live_snapshot.json';
  static const pagesUrl =
      'https://pavelcrypto70.github.io/macro-pulse/data/live_snapshot.json';
  static const pagesRootUrl =
      'https://pavelcrypto70.github.io/macro-pulse/live_snapshot.json';
  static const rawUrl =
      'https://raw.githubusercontent.com/Pavelcrypto70/macro-pulse/gh-pages/data/live_snapshot.json';
  static const pagesAssetUrl =
      'https://pavelcrypto70.github.io/macro-pulse/assets/assets/data/live_snapshot.json';

  final http.Client _client;

  Future<PulseData> load({bool forceNetwork = true}) async {
    String? error;

    if (forceNetwork) {
      try {
        final snap = await _fetchNetwork();
        await _saveCache(snap);
        return _fromLive(snap, PulseDataOrigin.liveNetwork);
      } catch (e) {
        error = e.toString();
        debugPrint('LivePulse network failed: $e');
      }
    }

    try {
      final cached = await _loadCache();
      if (cached != null) {
        return _fromLive(cached, PulseDataOrigin.liveCache, error: error);
      }
    } catch (e) {
      error ??= e.toString();
    }

    try {
      final asset = await _loadAsset();
      return _fromLive(asset, PulseDataOrigin.liveAsset, error: error);
    } catch (e) {
      error ??= e.toString();
      debugPrint('LivePulse asset failed: $e');
    }

    return PulseData(
      today: PulseCatalog.today,
      days: PulseCatalog.days,
      origin: PulseDataOrigin.curatedFallback,
      stamp: PulseCatalog.stamp,
      error: error,
    );
  }

  Future<LiveSnapshot> _fetchNetwork() async {
    final uris = <Uri>[
      if (kIsWeb) Uri.base.resolve('live_snapshot.json'),
      if (kIsWeb) Uri.base.resolve('data/live_snapshot.json'),
      Uri.parse(pagesRootUrl),
      Uri.parse(pagesUrl),
      Uri.parse(pagesAssetUrl),
      Uri.parse(rawUrl),
    ];
    Object? lastError;
    for (final uri in uris) {
      try {
        final res = await _client
            .get(uri, headers: {'Accept': 'application/json'})
            .timeout(const Duration(seconds: 12));
        if (res.statusCode >= 200 && res.statusCode < 300) {
          final map = jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;
          return LiveSnapshot.fromJson(map);
        }
        lastError = 'HTTP ${res.statusCode} for $uri';
      } catch (e) {
        lastError = e;
      }
    }
    throw Exception(lastError ?? 'No live snapshot URL worked');
  }

  Future<LiveSnapshot> _loadAsset() async {
    final raw = await rootBundle.loadString(assetPath);
    return LiveSnapshot.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<LiveSnapshot?> _loadCache() async {
    final p = await SharedPreferences.getInstance();
    final raw = p.getString(_cacheKey);
    if (raw == null || raw.isEmpty) return null;
    return LiveSnapshot.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> _saveCache(LiveSnapshot snap) async {
    // Re-encode from a known-good parse by storing the network body separately
    // would be nicer; here we reconstruct a compact JSON for prefs.
    final p = await SharedPreferences.getInstance();
    final map = {
      'schema': 1,
      'asOf': snap.asOf,
      'fetchedAt': snap.fetchedAt,
      'stamp': snap.stamp,
      'sources': snap.sources,
      'rates': snap.rates.extra,
      'inflation': snap.inflation.extra,
      'dollar': snap.dollar.extra,
      'mood': snap.mood.extra,
      'equities': snap.equities.extra,
    };
    await p.setString(_cacheKey, jsonEncode(map));
  }

  PulseData _fromLive(
    LiveSnapshot snap,
    PulseDataOrigin origin, {
    String? error,
  }) {
    final today = mergeLiveDay(PulseCatalog.templateToday, snap);
    final archive = PulseCatalog.archiveDays;
    return PulseData(
      today: today,
      days: [today, ...archive],
      origin: origin,
      stamp: snap.stamp,
      live: snap,
      error: error,
    );
  }
}

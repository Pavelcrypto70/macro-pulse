import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/live_pulse_repository.dart';
import '../data/pulse_catalog.dart';
import '../l10n/strings.dart';
import '../models/models.dart';

class AppState extends ChangeNotifier {
  AppState({LivePulseRepository? pulseRepo})
      : _pulseRepo = pulseRepo ?? LivePulseRepository();

  static const _kLang = 'lang';
  static const _kLangChosen = 'lang_chosen_v1';
  static const _kLegal = 'legal_ok';
  static const communityUrl = 'https://t.me/Desk_Club';
  static const tradeMasterUrl = 'https://pavelcrypto70.github.io/';
  static const sourceTag = 'macro-pulse';
  static const privacyUrl =
      'https://pavelcrypto70.github.io/macro-pulse-privacy.html';
  static const termsUrl =
      'https://pavelcrypto70.github.io/macro-pulse-terms.html';

  final LivePulseRepository _pulseRepo;

  AppLang lang = AppLang.en;
  bool languageChosen = false;
  bool legalAccepted = false;
  bool ready = false;

  PulseData? pulse;
  bool pulseLoading = false;

  S get s => S(lang);

  PulseDay get todayPulse => pulse?.today ?? PulseCatalog.today;

  List<PulseDay> get pulseDays => pulse?.days ?? PulseCatalog.days;

  String get pulseStamp => pulse?.stamp ?? PulseCatalog.stamp;

  bool get pulseIsLive => pulse?.isLive ?? false;

  String? get pulseAsOf => pulse?.live?.asOf;

  Future<void> load() async {
    final p = await SharedPreferences.getInstance();
    languageChosen = p.getBool(_kLangChosen) ?? false;
    if (languageChosen) {
      lang = appLangFromCode(p.getString(_kLang));
    } else {
      lang = AppLang.en; // neutral until user picks
    }
    legalAccepted = p.getBool(_kLegal) ?? false;
    // Show asset/cache immediately, then upgrade from network.
    pulse = await _pulseRepo.load(forceNetwork: false);
    ready = true;
    notifyListeners();
    unawaited(refreshPulse());
  }

  Future<void> refreshPulse() async {
    pulseLoading = true;
    notifyListeners();
    try {
      pulse = await _pulseRepo.load(forceNetwork: true);
    } catch (e) {
      debugPrint('refreshPulse failed: $e');
      pulse ??= await _pulseRepo.load(forceNetwork: false);
    } finally {
      pulseLoading = false;
      notifyListeners();
    }
  }

  Future<void> chooseLanguage(AppLang value) async {
    lang = value;
    languageChosen = true;
    final p = await SharedPreferences.getInstance();
    await p.setString(_kLang, value.code);
    await p.setBool(_kLangChosen, true);
    notifyListeners();
  }

  Future<void> setLang(AppLang value) async {
    lang = value;
    languageChosen = true;
    final p = await SharedPreferences.getInstance();
    await p.setString(_kLang, value.code);
    await p.setBool(_kLangChosen, true);
    notifyListeners();
  }

  Future<void> acceptLegal() async {
    legalAccepted = true;
    final p = await SharedPreferences.getInstance();
    await p.setBool(_kLegal, true);
    notifyListeners();
  }

  Future<void> resetLegal() async {
    legalAccepted = false;
    final p = await SharedPreferences.getInstance();
    await p.setBool(_kLegal, false);
    notifyListeners();
  }

  Future<void> resetLanguageChoice() async {
    languageChosen = false;
    legalAccepted = false;
    final p = await SharedPreferences.getInstance();
    await p.setBool(_kLangChosen, false);
    await p.setBool(_kLegal, false);
    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../l10n/strings.dart';

class AppState extends ChangeNotifier {
  AppState();

  static const _kLang = 'lang';
  static const _kLegal = 'legal_ok';
  static const communityUrl = 'https://t.me/Desk_Club';
  static const sourceTag = 'macro-pulse';

  AppLang lang = AppLang.en;
  bool legalAccepted = false;
  bool ready = false;

  S get s => S(lang);
  bool get isRu => lang.isRu;

  Future<void> load() async {
    final p = await SharedPreferences.getInstance();
    final code = p.getString(_kLang);
    lang = code == 'ru' ? AppLang.ru : AppLang.en;
    legalAccepted = p.getBool(_kLegal) ?? false;
    ready = true;
    notifyListeners();
  }

  Future<void> setLang(AppLang value) async {
    lang = value;
    final p = await SharedPreferences.getInstance();
    await p.setString(_kLang, value.code);
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
}

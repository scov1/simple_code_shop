import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  SharedPreferences? prefs;
  static const prefKey = 'pref_key';

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool?> saveLocale(String locale) async {
    if (prefs == null) return false;
    return prefs?.setString('locale', locale);
  }

  Future<String?> readLocale() async {
    if (prefs == null) return null;
    return prefs?.getString('locale');
  }

  Future<bool?> saveAuth() async {
    if (prefs == null) return null;
    return prefs?.setBool('login', true);
  }

  Future<bool?> checkAuth() async {
    if (prefs == null) return null;
    return prefs?.getBool('login');
  }

  Future<bool?> logoutAuth() async {
    if (prefs == null) return null;
    return prefs?.setBool('login', false);
  }

  setTheme(bool value) async {
    if (prefs == null) return false;
    prefs?.setBool(prefKey, value);
  }

  getTheme() async {
    if (prefs == null) return false;
    prefs?.getBool(prefKey);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceData{
  static PreferenceData? _preferenceData;
  static SharedPreferences? _preferences;
  static String token = "tabco_token";

  static Future getInstance() async {
    if (_preferenceData == null) {
      // keep local instance till it is fully initialized.
      var secureStorage = PreferenceData._();
      await secureStorage._init();
      _preferenceData = secureStorage;
    }
    return _preferenceData;
  }
  PreferenceData._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }
  static void clearData() {
    PreferenceData.setToken("");
  }
  static Future? setToken(String value) {
    if (_preferences == null) return null;
    return _preferences!.setString(token, value);
  }
}
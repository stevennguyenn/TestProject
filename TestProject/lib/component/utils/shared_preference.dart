import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  final String _keyLanguageCode = "keyLanguageCode";

  static final shared = SharedPreference();

  setLanguageCode(String code) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLanguageCode, code);
  }

  Future<String> getLanguageCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLanguageCode) ?? "vi";
  }

  removeAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove(_keyToken);
    // await prefs.remove(_keyUser);
  }
}

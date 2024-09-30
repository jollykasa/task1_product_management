import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const _keyUsername = 'username';
  static SharedPreferences? _sharedPreferences;
  static Future init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future<void> setUserEmail(String email) async {
    await _sharedPreferences!.setString(_keyUsername, email);
  }

  String? getUserEmail() {
    return _sharedPreferences!.getString(_keyUsername);
  }

  static Future deleteUser() async {
    await _sharedPreferences!.remove(_keyUsername);
  }
}

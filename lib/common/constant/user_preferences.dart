import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/common/constant/app_constant.dart';

class UserPreferences {
  static const _keyUsername = 'username';
  static SharedPreferences? _sharedPreferences;
  static Future init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  static Future<void> setUserEmail(String email) async {
    await _sharedPreferences!.setString(_keyUsername, email);
  }

  static String? getUserEmail() {
    return _sharedPreferences!.getString(_keyUsername);
  }

  static Future<void> isSetUserLoggedIn(bool isLoggedIn) async {
    await _sharedPreferences?.setBool(AppConstant.keyLogin, isLoggedIn);
  }

  static bool? isGetUserLoggedIn() {
    return _sharedPreferences?.getBool(AppConstant.keyLogin);
  }

  static Future<void> setProductId(String productId) async {
    await _sharedPreferences?.setString(_keyUsername, productId);
  }

  static String? getProductId() {
    return _sharedPreferences!.getString(_keyUsername);
  }
}

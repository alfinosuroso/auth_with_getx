import 'dart:convert';

import 'package:auth_with_getx/common/shared_code.dart';
import 'package:auth_with_getx/model/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static Future<SharedPreferences> get _instance async =>
      prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences? prefs;

  // Call this on Main()
  static Future<SharedPreferences> init() async {
    prefs = await _instance;
    return prefs ?? await SharedPreferences.getInstance();
  }

  static AuthModel? getAuthModel() {
    String? authJson = prefs?.getString(SharedCode.authJson);
    if (authJson != null) {
      AuthModel authModel = authModelFromJson(authJson);
      return authModel;
    }
    return null;
  }

  static Future<void> setAuthModel(AuthModel authModel) async {
    await prefs?.setString(SharedCode.authJson, jsonEncode(authModel.toJson()));
  }

  static String? getToken() {
    final auth = getAuthModel();
    return auth?.accessToken;
  }

  static Future<void> clearAllPrefs() async {
    await prefs?.clear();
  }
}

import 'dart:convert';

import 'package:auth_with_getx/common/shared_code.dart';
import 'package:auth_with_getx/model/auth_model.dart';
import 'package:auth_with_getx/services/shared_preferences_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthRepositories {
  register(String name, String email, String password) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      'Content-Type': 'application/json',
    };
    var map = <String, dynamic>{};
    map['username'] = name;
    map['email'] = email;
    map['password'] = password;
    try {
      final res = await http.post(
        Uri.parse('${SharedCode.baseUrl}/users/add'),
        headers: headers,
        body: json.encode(map),
      );
      debugPrint(res.statusCode.toString());
      debugPrint(res.body);

      if (res.body.isEmpty ||
          (res.statusCode != 201 && res.statusCode != 400)) {
        throw "Sorry, there is a problem with the server. Please try again later";
      }

      // final model = authModelFromJson(res.body);

      if (res.statusCode == 201) {
        return true;
      } else if (res.statusCode == 400) {
        await SharedPreferencesService.clearAllPrefs();
        throw json.decode(res.body)['error'];
      } else {
        throw "Sorry, there is a problem with the server. Please try again later";
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        debugPrint('Exception occured: $error stackTrace: $stacktrace');
      }
      throw error.toString();
    }
  }

  login(String name, String password) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      'Content-Type': 'application/json',
    };
    var map = <String, dynamic>{};
    map['username'] = name;
    map['password'] = password;
    try {
      final res = await http.post(
        Uri.parse('${SharedCode.baseUrl}/users/login'),
        headers: headers,
        body: json.encode(map),
      );
      debugPrint(res.statusCode.toString());
      debugPrint(res.body);

      if (res.body.isEmpty ||
          (res.statusCode != 200 && res.statusCode != 400)) {
        throw "Sorry, there is a problem with the server. Please try again later";
      }

      if (res.statusCode == 200) {
        final model = authModelFromJson(res.body);
        await SharedPreferencesService.setAuthModel(model);
        return true;
      } else if (res.statusCode == 400) {
        await SharedPreferencesService.clearAllPrefs();
        throw json.decode(res.body)['message'];
      } else {
        throw "Sorry, there is a problem with the server. Please try again later";
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        debugPrint('Exception occured: $error stackTrace: $stacktrace');
      }
      throw error.toString();
    }
  }
}

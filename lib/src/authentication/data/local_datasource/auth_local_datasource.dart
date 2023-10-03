import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/src/authentication/data/model/response/auth_response_model.dart';
import 'package:restaurant_app/src/restaurant/presentation/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  static Future<bool> saveAuthData(AuthResponseModel authData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final res = prefs.setString('auth', jsonEncode(authData.toJson()));
    return res;
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(jsonDecode(authJson));
    return authData.jwt;
  }

  static Future<bool> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.remove('auth');
    return result;
  }

  static Future<bool> authCheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    return authJson.isNotEmpty;
  }
}

class SplashDatasource {
  static Future directToHomePage(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => context.pushReplacement(HomePage.routeName),
    );
  }
}

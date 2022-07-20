import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sa3ada_app/utils/services/localization_service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageKeys {
  StorageKeys();

  //Declare all storage keys here & create its correpsonding setters & getters
  static const String token = "TOKEN";
  static const String activeLocale = "ACTIVE_LOCAL";
  static const String hasSeenSplashScreens = "HAS_SEEN_SPLASH_SCREENS";
  static const String isLoggedIn = "IS_LOGGED_IN";
}

class StorageService extends GetxService {
  StorageService(this._prefs);

  final SharedPreferences _prefs;

  static Future<StorageService> init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  /// Delete stored data by key
  void deleteKey(String key) {
    _prefs.remove(key);
  }

  /// Trigger anything for 1 time, like Dialogues
  Future<String> triggerOnce(String key) async {
    final value = _prefs.getString(key);
    if (value == null) {
      _prefs.setString(key, "true");
      return "true";
    } else {
      throw "key: $key, is triggered before";
    }
  }

  //TOKEN
  String get token {
    return _prefs.getString(StorageKeys.token) ?? "";
  }

  set token(String? token) {
    _prefs.setString(StorageKeys.token, token.toString());
  }

  //Active Locale
  Locale get activeLocale {
    return Locale(_prefs.getString(StorageKeys.activeLocale) ??
        SupportedLocales.arabic.toString());
  }

  set activeLocale(Locale activeLocal) {
    _prefs.setString(StorageKeys.activeLocale, activeLocal.toString());
  }

  //is Logged in
  bool get isLoggedIn {
    return _prefs.getBool(StorageKeys.isLoggedIn) ?? false;
  }

  set isLoggedIn(bool isLoggedIn) {
    _prefs.setBool(StorageKeys.isLoggedIn, isLoggedIn);
  }
}

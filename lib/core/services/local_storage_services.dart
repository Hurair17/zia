import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  ///
  /// List of const keys
  ///
  // static const String onboardingCountKey = 'onBoardingCount';
  static const String notificationsCountKey = 'snotificationsCount';
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';
  static const String notificationKey = 'notificationFlag';
  static const String otpScreenKey = 'otpScreen';

  ///
  /// Setters and getters
  ///
  // int get onBoardingPageCount => _getFromDisk(onboardingCountKey) ?? 0;
  // set setOnBoardingPageCount(int count) =>
  //     _saveToDisk(onboardingCountKey, count);

  int get setNotificationsCount => _getFromDisk(notificationsCountKey) ?? 0;
  set setNotificationsCount(int count) =>
      _saveToDisk(notificationsCountKey, count);

  dynamic get accessToken => _getFromDisk(accessTokenKey);
  set setAccessToken(String? token) => _saveToDisk(accessTokenKey, token);

  dynamic get otpAccessToken => _getFromDisk(otpScreenKey);
  set setOtpAccessToken(String? token) => _saveToDisk(otpScreenKey, token);

  dynamic get refreshToken => _getFromDisk(refreshTokenKey);

  dynamic get notificationFlag => _getFromDisk(notificationKey);
  set setNotificationFlag(String? isTurnOn) =>
      _saveToDisk(notificationKey, isTurnOn);

  getVisitingFlag() async {
    return _preferences?.getBool('alreadyUser') ?? false;
  }

  dynamic _getFromDisk(String key) {
    var value = _preferences?.get(key);
    debugPrint(
        '(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

////
  ///initializing instance
  ///
  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  setVisitingFlag() async {
    _preferences?.setBool('alreadyUser', true);
  }

  void _saveToDisk<T>(String key, T content) {
    debugPrint(
        '(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');

    if (content is String) {
      _preferences?.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }
    if (content == null) {
      _preferences?.remove(key);
    }
  }

  static Future<LocalStorageService> getinstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }
}

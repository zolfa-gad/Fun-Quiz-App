import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalServices {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveLocalData(String key, dynamic value) async {
    late Future<bool> result;
    debugPrint(value.toString());
    if (value is String) {
      result = sharedPreferences.setString(key, value);
    } else if (value is bool) {
      result = sharedPreferences.setBool(key, value);
    } else if (value is double) {
      result = sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      result = sharedPreferences.setInt(key, value);
    }else if (value is List) {
      result = sharedPreferences.setStringList(key, value as List<String>);
    }
    debugPrint('Prefs: $result');
    return await result;
  }

  static dynamic getLocalData(String key) {
    return sharedPreferences.get(key);
  }

  static deleteLocalData(String key) {
    return sharedPreferences.remove(key);
  }
}

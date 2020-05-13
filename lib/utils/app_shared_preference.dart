import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartblooddonor/user/models/User.dart';

class AppSharedPreference {
  static AppSharedPreference _instance;

  SharedPreferences _preferences;

  AppSharedPreference._(this._preferences);

  static Future<AppSharedPreference> get instance async {
    if (_instance == null) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      _instance = AppSharedPreference._(pref);
    }
    return _instance;
  }

  static Future<User> get login async {
    AppSharedPreference inst = await instance;
    String loginData = inst._preferences.getString('user') ?? {};
    return User.fromMap(json.decode(loginData));
  }

  static Future<void> setLogin(User user) async {
    String userData = user.toString();
    AppSharedPreference prefs = await instance;
    prefs._preferences.setString('user', userData);
  }
}

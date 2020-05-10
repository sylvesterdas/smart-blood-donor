class AppSharedPreference {
  static AppSharedPreference _instance;

  AppSharedPreference._();

  static AppSharedPreference get instance {
    if (_instance == null) {
      _instance = AppSharedPreference._();
    }
    return _instance;
  }
}

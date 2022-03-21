class AppConstants {
  final env = {
    "development": {"USER_TOKEN": "USER_TOKEN"},
    "production": {"USER_TOKEN": "USER_TOKEN"}
  };

  getAppConstant() {
    return env;
  }
}

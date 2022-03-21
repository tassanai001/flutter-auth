import 'package:flutter/material.dart';
import 'package:flutter_auth_app/constants/api-path.dart';
import 'package:flutter_auth_app/constants/app-constants.dart';

enum Flavor {
  DEVELOPMENT,
  PRODUCTION,
}

class EnvironmentConfig {
  static Flavor appFlavor;

  static String get apiPath {
    var env = ApiPath().getApiPath();
    switch (appFlavor) {
      case Flavor.PRODUCTION:
        return env['production']['api_url'];
      case Flavor.DEVELOPMENT:
      default:
        return env['development']['api_url'];
    }
  }

  static Map<String, String> get appConstant {
    var env = AppConstants().getAppConstant();
    switch (appFlavor) {
      case Flavor.PRODUCTION:
        return env['production'];
      case Flavor.DEVELOPMENT:
      default:
        return env['development'];
    }
  }

  static String get helloMessage {
    switch (appFlavor) {
      case Flavor.PRODUCTION:
        return 'PRODUCTION';
      case Flavor.DEVELOPMENT:
      default:
        return 'DEVELOPMENT';
    }
  }

  static Icon get helloIcon {
    switch (appFlavor) {
      case Flavor.PRODUCTION:
        return new Icon(Icons.new_releases);
      case Flavor.DEVELOPMENT:
      default:
        return new Icon(Icons.developer_mode);
    }
  }
}

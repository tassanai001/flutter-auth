import 'package:flutter/material.dart';

import 'appEntry.dart';
import 'config/environment-config.dart';

void main() {
  EnvironmentConfig.appFlavor = Flavor.DEVELOPMENT;
  runApp(new MyApp());
}

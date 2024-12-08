import 'package:flutter_flavor/flutter_flavor.dart';


class EnvironmentConfig {
  static final String baseUrl = const String.fromEnvironment("BASE_URL") != ''
      ? const String.fromEnvironment("BASE_URL")
      : flavorConfig.variables['baseUrl'] as String;

  static FlavorConfig get flavorConfig => FlavorConfig.instance;
}

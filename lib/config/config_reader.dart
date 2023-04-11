import 'dart:convert';

import 'package:flutter/services.dart';

abstract class ConfigReader {
  static Map<String, dynamic> _config = {};

  static Future<void> initialize() async {
    final configString =
        await rootBundle.loadString('lib/config/app_config.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getRapidAPIKey() {
    return _config['rapidAPIKEY'] as String;
  }
}

import 'package:flutter/material.dart';

import 'api_key.dart';

class AppConstants {
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/forecast';
  static const String apiKey = weatherAPIKey; // Add Your API Key
  static const String backgroundImage =
      "lib/base_module/presentation/core/assets/background.png";
  static String getCloudImageUrl(code) =>
      "https://openweathermap.org/img/wn/$code@2x.png";
  static const String degreeSymbol = '\u00B0';
  static const Color cardFontColor = Color(0xFFF6C8A4);
}

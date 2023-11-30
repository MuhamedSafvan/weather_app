import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  static Size getSize(context) => MediaQuery.sizeOf(context);
  static String capitalize(String? text) => text!.substring(1).toLowerCase();
  static String formatTimestampToTime(int timestampSeconds) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(timestampSeconds * 1000);
    String formattedTime = DateFormat('h a').format(dateTime);

    return formattedTime;
  }
}

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
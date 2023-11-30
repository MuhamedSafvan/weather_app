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

// String extractSelectedDate(String? inputDate) {
//   DateTime parsedDate = DateTime.parse(inputDate!);
//   DateTime currentDate = DateTime.now();
//   DateTime tomorrowDate = currentDate.add(Duration(days: 1));

//   if (parsedDate.year == currentDate.year &&
//       parsedDate.month == currentDate.month &&
//       parsedDate.day == currentDate.day) {
//     return 'Today';
//   } else if (parsedDate.year == tomorrowDate.year &&
//       parsedDate.month == tomorrowDate.month &&
//       parsedDate.day == tomorrowDate.day) {
//     return 'Tomorrow';
//   } else {
//     return DateFormat('yyyy-MM-dd').format(parsedDate);
//   }
// }

String extractSelectedDate(int timestampSeconds) {
  DateTime parsedDate = DateTime.fromMillisecondsSinceEpoch(timestampSeconds * 1000);
  DateTime currentDate = DateTime.now();
  DateTime tomorrowDate = currentDate.add(Duration(days: 1));

  if (isSameDay(parsedDate, currentDate)) {
    return 'Today';
  } else if (isSameDay(parsedDate, tomorrowDate)) {
    return 'Tomorrow';
  } else {
    return DateFormat('dd-MMM-yyyy').format(parsedDate);
  }
}

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}
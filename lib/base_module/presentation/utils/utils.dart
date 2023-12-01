import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/home_module/presentation/features/screens/error_screen.dart';
import 'package:weather_app/main.dart';

Future<Position> determinePosition({bool retry = false}) async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
  if (retry) {
    await Geolocator.openLocationSettings();
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      Navigator.pushReplacement(
        navigatorKey.currentContext!,
        MaterialPageRoute(
            builder: (context) =>
                ErrorScreen(message: "Location permissions are denied")),
      );
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // if (retry) {
    //    await Geolocator.openLocationSettings();
    //    permission = await Geolocator.requestPermission();
    // } else {
    Navigator.pushReplacement(
      navigatorKey.currentContext!,
      MaterialPageRoute(
          builder: (context) => ErrorScreen(
              message:
                  "Location permissions are permanently denied, we cannot request permissions.")),
    );
    // }
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}

String extractSelectedDate(int timestampSeconds) {
  DateTime parsedDate =
      DateTime.fromMillisecondsSinceEpoch(timestampSeconds * 1000);
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

Size getSize(context) => MediaQuery.sizeOf(context);
String capitalize(String? text) => text!.substring(1).toLowerCase();
String formatTimestampToTime(int timestampSeconds) {
  DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(timestampSeconds * 1000);
  String formattedTime = DateFormat('h a').format(dateTime);

  return formattedTime;
}

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

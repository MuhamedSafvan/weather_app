import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/base_module/domain/repository/weather_provider.dart';
import 'package:weather_app/home_module/presentation/features/bloc/weather_bloc/weather_bloc_bloc.dart';
import 'package:weather_app/home_module/presentation/features/screens/weather_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WeatherPage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

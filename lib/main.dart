import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/base_module/domain/repository/weather_provider.dart';

import 'home_module/presentation/features/bloc/weather_bloc/weather_bloc_bloc.dart';
import 'home_module/presentation/features/screens/weather_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final WeatherProvider weatherProvider = WeatherProvider();
  final WeatherBlocBloc weatherBloc = WeatherBlocBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: BlocProvider(
        create: (context) => weatherBloc,
        child: WeatherPage(),
      ),
    );
  }
}

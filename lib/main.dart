import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/base_module/domain/repository/weather_provider.dart';
import 'package:weather_app/base_module/presentation/screens/splash_screen.dart';

import 'home_module/presentation/features/bloc/weather_bloc/weather_bloc_bloc.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final WeatherProvider weatherProvider = WeatherProvider();
  final WeatherBlocBloc weatherBloc = WeatherBlocBloc();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: true,
          create: (_) => WeatherBlocBloc(),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Poppins',
        ),
        home: SplashScreen(),
        // home: BlocProvider(
        //   create: (context) => WeatherBlocBloc(),
        //   child: WeatherPage(),
        // ),
      ),
    );
  }
}

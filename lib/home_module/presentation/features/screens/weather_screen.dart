import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/base_module/presentation/utils/utils.dart';
import 'package:weather_app/home_module/presentation/features/screens/error_screen.dart';
import '../bloc/weather_bloc/weather_bloc_bloc.dart';
import 'weather_home.dart';

class WeatherPage extends StatefulWidget {
  final bool isRetry;
  WeatherPage({this.isRetry = false});
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  void getWeather() async {
    final position = await determinePosition(retry: widget.isRetry);
    final weatherBloc = BlocProvider.of<WeatherBlocBloc>(context);
    weatherBloc.add(GetWeather(position.latitude, position.longitude));
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
        builder: (context, state) {
          if (state is WeatherBlocInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherBlocLoaded) {
            // Display weather information here
            return WeatherHome(
                data: state.data, weatherList: state.weatherList);
          } else if (state is WeatherBlocError) {
            return ErrorScreen(message: state.message);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

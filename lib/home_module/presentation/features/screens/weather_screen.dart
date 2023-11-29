import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/weather_bloc/weather_bloc_bloc.dart';
import 'weather_home.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBlocBloc>(context);

    return Scaffold(
      body: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
        builder: (context, state) {
          if (state is WeatherBlocInitial) {
            return const Center(
              child: Text('Enter a city to get weather information'),
            );
          } else if (state is WeatherBlocLoaded) {
            // Display weather information here
            return WeatherHome(data: state.data);
          } else if (state is WeatherBlocError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Trigger the event to get weather data
          weatherBloc.add(const GetWeather(12.9239179, 77.6082065));
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/base_module/domain/repository/weather_provider.dart';

import '../../../../../base_module/data/models/weather_response_model.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherProvider weatherProvider = WeatherProvider();
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<WeatherBlocEvent>((event, emit) {});
    on<GetWeather>((event, emit) async {
      try {
        final weatherData = await weatherProvider.getWeather(event.lat,event.long);
        emit(WeatherBlocLoaded(WeatherResponse.fromJson(weatherData.data)));
      } catch (e) {
        print(e.toString());
        emit(const WeatherBlocError("Failed to fetch weather data"));
      }
    });
  }
}

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
      emit(WeatherBlocInitial());
      try {
        final weatherData =
            await weatherProvider.getWeather(event.lat, event.long);
        final weatherDataResponse = WeatherResponse.fromJson(weatherData.data);
        if (weatherDataResponse.list != null &&
            weatherDataResponse.list!.isNotEmpty) {}
        Map<String?, List<WeatherData>> groupedData =
            weatherDataResponse.list!.groupBy((data) => formatTimestampToDate(data.dt!));
            // weatherDataResponse.list!.groupBy((data) => extractDate(data.dtTxt));

        List<List<WeatherData>> result = groupedData.values.toList();
        emit(WeatherBlocLoaded(weatherDataResponse, result));
        
      } catch (e) {
        print(e.toString());
        emit(const WeatherBlocError("Failed to fetch weather data"));
      }
    });
  }
}

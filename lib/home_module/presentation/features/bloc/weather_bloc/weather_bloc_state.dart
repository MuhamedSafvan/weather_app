part of 'weather_bloc_bloc.dart';

abstract class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

final class WeatherBlocInitial extends WeatherBlocState {}

class WeatherBlocLoaded extends WeatherBlocState {
  // final Map<String, dynamic> data;
  final WeatherResponse data;
  final List<List<WeatherData>> weatherList;

  const WeatherBlocLoaded(this.data, this.weatherList);

  @override
  List<Object> get props => [data, weatherList];
}

class WeatherBlocError extends WeatherBlocState {
  final String message;

  const WeatherBlocError(this.message);

  @override
  List<Object> get props => [message];
}

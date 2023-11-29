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

  const WeatherBlocLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class WeatherBlocError extends WeatherBlocState {
  final String message;

  const WeatherBlocError(this.message);

  @override
  List<Object> get props => [message];
}

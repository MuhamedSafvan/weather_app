part of 'weather_bloc_bloc.dart';

abstract class WeatherBlocEvent extends Equatable {
  const WeatherBlocEvent();

  @override
  List<Object> get props => [];
}

class GetWeather extends WeatherBlocEvent {
  final double lat;
  final double long;

  const GetWeather(this.lat,this.long);

  @override
  List<Object> get props => [lat,long];
}

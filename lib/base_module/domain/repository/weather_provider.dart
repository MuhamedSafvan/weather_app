import 'package:dio/dio.dart';
import 'package:weather_app/base_module/presentation/core/values/constants.dart';
import 'package:weather_app/base_module/data/dio_helper.dart';

class WeatherProvider {
  final String apiKey = AppConstants.apiKey;
  final String baseUrl = AppConstants.baseUrl;
  final _dio = DioHelper.dio;

  Future<Response> getWeather(double lat, double long) async {
    final url =
        "$baseUrl?lat=$lat&lon=$long&appid=$apiKey&units=metric&exclude=minutely";
    final response = await _dio.get(url);
    print("response.data ${response.data}");
    return response;
  }
}

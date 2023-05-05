import 'package:dio/dio.dart';

import 'package:weather_app/data/models/weather_response.dart';

class WeatherRepository {
  final Dio dio = Dio();

  Future<WeatherResponse> getWeatherForLocation(String placeName) async {
    try {
      final Response response = await dio.get(
        'http://api.weatherapi.com/v1/current.json?key=a2777888a2a54a929cb134311230305',
        queryParameters: {
          "q": placeName,
          "aqi": "no",
        },
      );

      final WeatherResponse weatherResponse =
          WeatherResponse.fromJson(response.data);

      return weatherResponse;
    } catch (e) {
      rethrow; // rethrow the error to propagate it up the call stack
    }
  }
}

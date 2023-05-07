import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/models/current.dart';

class WeatherResponse {
  const WeatherResponse(
      {required this.location, required this.current, required this.forecast});

  final Location location;
  final Current current;
  final Forecast forecast;

  factory WeatherResponse.fromJson(Map<String, dynamic> jsonWeather) =>
      WeatherResponse(
        location: Location.fromJson(jsonWeather["location"]),
        current: Current.fromJson(jsonWeather["current"]),
        forecast: Forecast.fromJson(jsonWeather["forecast"]),
      );
}

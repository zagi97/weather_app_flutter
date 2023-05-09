import 'package:weather_app/data/models/forecast.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/models/current.dart';

class WeekWeatherResponse {
  const WeekWeatherResponse(
      {required this.location, required this.current, required this.forecast});

  final Location location;
  final Current current;
  final Forecast forecast;

  factory WeekWeatherResponse.fromJson(Map<String, dynamic> jsonWeather) =>
      WeekWeatherResponse(
        location: Location.fromJson(jsonWeather["location"]),
        current: Current.fromJson(jsonWeather["current"]),
        forecast: Forecast.fromJson(jsonWeather["forecast"]),
      );
}

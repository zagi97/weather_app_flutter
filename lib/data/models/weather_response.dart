import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/models/current.dart';

class WeatherResponse {
  const WeatherResponse({
    required this.location,
    required this.current,
  });

  final Location location;
  final Current current;

  factory WeatherResponse.fromJson(Map<String, dynamic> jsonWeather) =>
      WeatherResponse(
        location: Location.fromJson(jsonWeather["location"]),
        current: Current.fromJson(jsonWeather["current"]),
      );
}

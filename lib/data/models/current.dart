import 'package:weather_app/data/models/condition.dart';

class Current {
  const Current(
      {required this.lastUpdated,
      required this.tempInCelsius,
      required this.condition,
      required this.windKph,
      required this.precipMm,
      required this.humidity});

  final String lastUpdated;
  final double tempInCelsius;
  final Condition condition;
  final double windKph;
  final double precipMm;
  final int humidity;

  factory Current.fromJson(Map<String, dynamic> jsonWeather) => Current(
        lastUpdated: jsonWeather['last_updated'],
        tempInCelsius: jsonWeather['temp_c'],
        condition: Condition.fromJson(jsonWeather['condition']),
        windKph: jsonWeather['wind_kph'],
        precipMm: jsonWeather['precip_mm'],
        humidity: jsonWeather['humidity'],

        /* user: List<User>.from(json_weather["user"].map((x) => User.fromJson(x))), */
      );
}

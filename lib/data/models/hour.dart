import 'package:weather_app/data/models/hour_condition.dart';

class Hour {
  const Hour({
    required this.time,
    required this.temp_c,
    required this.hourCondition,
    required this.wind_kph,
    required this.wind_dir,
    required this.pressure_mb,
    required this.humidity,
    required this.cloud,
    required this.feelslike_c,
    required this.chance_of_rain,
  });

  final String time;
  final int temp_c;
  final HourCondition hourCondition;
  final int wind_kph;
  final String wind_dir;
  final int pressure_mb;
  final int humidity;
  final int cloud;
  final int feelslike_c;
  final int chance_of_rain;

  factory Hour.fromJson(Map<String, dynamic> jsonWeather) => Hour(
      time: jsonWeather['time'],
      temp_c: jsonWeather['temp_c'],
      hourCondition: HourCondition.fromJson(jsonWeather['condition']),
      wind_kph: jsonWeather['wind_kph'],
      wind_dir: jsonWeather['wind_dir'],
      pressure_mb: jsonWeather['pressure_mb'],
      humidity: jsonWeather['humidity'],
      cloud: jsonWeather['cloud'],
      feelslike_c: jsonWeather['feelslike_c'],
      chance_of_rain: jsonWeather['chance_of_rain']);
}

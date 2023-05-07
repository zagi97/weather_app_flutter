import 'package:weather_app/data/models/day_condition.dart';

class Day {
  const Day({
    required this.maxtemp_c,
    required this.mintemp_c,
    required this.maxwind_kph,
    required this.totalprecip_mm,
    required this.condition_day,
  });

  final int maxtemp_c;
  final int mintemp_c;
  final int maxwind_kph;
  final int totalprecip_mm;
  final DayCondition condition_day;

  factory Day.fromJson(Map<String, dynamic> jsonWeather) => Day(
        maxtemp_c: jsonWeather['maxtemp_c'],
        mintemp_c: jsonWeather['mintemp_c'],
        maxwind_kph: jsonWeather['maxwind_kph'],
        totalprecip_mm: jsonWeather['totalprecip_mm'],
        condition_day: DayCondition.fromJson(jsonWeather['maxtemp_c']),
      );
}

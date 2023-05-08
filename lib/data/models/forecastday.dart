import 'package:weather_app/data/models/day.dart';
import 'package:weather_app/data/models/astro.dart';
import 'package:weather_app/data/models/hour.dart';

class ForecastDay {
  const ForecastDay(
      {required this.date,
      required this.day,
      required this.astro,
      required this.hour});

  final String date;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  factory ForecastDay.fromJson(Map<String, dynamic> jsonWeather) => ForecastDay(
        date: jsonWeather["date"],
        day: Day.fromJson(jsonWeather["day"]),
        astro: Astro.fromJson(jsonWeather["astro"]),
        /*  hour: Hour.fromJson(jsonWeather["hour"]), */
        hour: [
          for (final singleHour in jsonWeather["hour"])
            Hour.fromJson(singleHour),
        ],
      );
}

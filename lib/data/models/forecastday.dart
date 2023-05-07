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
  final Hour hour;

  factory ForecastDay.fromJson(Map<String, dynamic> jsonWeather) => ForecastDay(
        date: jsonWeather["date"],
        day: Day.fromJson(jsonWeather["day"]),
        astro: Astro.fromJson(jsonWeather["astro"]),
        hour: Hour.fromJson(jsonWeather["hour"]),
      );
}

/* class Location {
  Location(
      {required this.name,
      required this.region,
      required this.country,
      required this.lat,
      required this.lng,
      required this.timeZone,
      required this.localTime});

  final String name;
  final String region;
  final String country;
  final double lat;
  final double lng;
  final String timeZone;
  final String localTime;

  factory Location.fromJson(Map<String, dynamic> jsonWeather) => Location(
        name: jsonWeather["name"],
        region: jsonWeather["region"],
        country: jsonWeather["country"],
        lat: jsonWeather["lat"],
        lng: jsonWeather["lon"],
        timeZone: jsonWeather["tz_id"],
        localTime: jsonWeather["localtime"],
      );
} */
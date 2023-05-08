import 'package:weather_app/data/models/forecastday.dart';

class Forecast {
  const Forecast({required this.forecastday});

  /*  final ForecastDay forecastday;

  factory Forecast.fromJson(Map<String, dynamic> jsonWeather) => Forecast(
        forecastday: ForecastDay.fromJson(jsonWeather["forecastday"]),
      ); */

  final List<ForecastDay> forecastday;

  factory Forecast.fromJson(Map<String, dynamic> jsonWeather) => Forecast(
        forecastday: [
          for (final day in jsonWeather["forecastday"])
            ForecastDay.fromJson(day),
        ],
      );
}

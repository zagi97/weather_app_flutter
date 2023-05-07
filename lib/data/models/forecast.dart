import 'package:weather_app/data/models/forecastday.dart';

class Forecast {
  const Forecast({required this.forecastDay});

  final ForecastDay forecastDay;

  factory Forecast.fromJson(Map<String, dynamic> jsonWeather) => Forecast(
        forecastDay: ForecastDay.fromJson(jsonWeather["forecastday"]),
      );
}

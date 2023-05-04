import 'package:weather_app/data/models/condition.dart';

class Current {
  const Current(
      {required this.tempInCelsius,
      required this.lastUpdated,
      required this.condition});

  final double tempInCelsius;
  final String lastUpdated;
  final Condition condition;

  factory Current.fromJson(Map<String, dynamic> jsonWeather) => Current(
        tempInCelsius: jsonWeather["temp_c"],
        lastUpdated: jsonWeather["last_updated"],
        condition: jsonWeather["condition"],

        /* user: List<User>.from(json_weather["user"].map((x) => User.fromJson(x))), */
      );
}

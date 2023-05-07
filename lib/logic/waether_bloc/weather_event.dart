part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent([List props = const []]) : super();
}

class GetWeather extends WeatherEvent {
  final String cityName;

  const GetWeather(this.cityName);

  @override
  List<Object?> get props => [cityName];
}

class GetWeekWeatherForLocation extends WeatherEvent {
  final String cityName;

  const GetWeekWeatherForLocation(this.cityName);

  @override
  List<Object?> get props => [cityName];
}

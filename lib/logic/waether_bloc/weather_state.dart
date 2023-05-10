// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'weather_bloc.dart';

enum WeatherStatus { initial, loading, loaded, failure }

class WeatherState extends Equatable {
  WeatherState({
    required this.status,
    this.weatherResponse,
    this.weekWeatherResponse,
  });
  final WeatherStatus status;
  WeatherResponse? weatherResponse;
  WeekWeatherResponse? weekWeatherResponse;

  WeatherState.initial() : status = WeatherStatus.initial;

  @override
  List<Object?> get props => [status, weatherResponse];

  List<Object?> get weekProps => [status, weekWeatherResponse];
}

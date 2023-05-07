// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

enum WeatherStatus { initial, loading, loaded, failure }

class WeatherState extends Equatable {
  WeatherState({
    required this.status,
    this.weatherResponse,
  });
  final WeatherStatus status;
  WeatherResponse? weatherResponse;

  WeatherState.initial() : status = WeatherStatus.initial;

  @override
  List<Object?> get props => [status, weatherResponse];
}

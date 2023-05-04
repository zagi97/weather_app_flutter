part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState([List props = const []]) : super();
}

class WeatherEmpty extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded(this.weatherResponse);

  final WeatherResponse weatherResponse;

  @override
  List<Object?> get props => [weatherResponse];
}

class WeatherError extends WeatherState {
  @override
  List<Object?> get props => [];
}

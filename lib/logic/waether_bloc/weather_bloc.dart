import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:weather_app/data/models/weather_response.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = WeatherRepository();

  WeatherBloc() : super(WeatherState.initial()) {
    on<GetWeather>(_onGetWeather);
  }

  Future<void> _onGetWeather(
      GetWeather event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherState(status: WeatherStatus.loading,));
      final weatherData =
          await weatherRepository.getWeatherForLocation(event.cityName);
      emit(WeatherState(status: WeatherStatus.loaded, weatherResponse: weatherData));
    } catch (_) {
      emit(WeatherState(status: WeatherStatus.failure));
    }
  }
}

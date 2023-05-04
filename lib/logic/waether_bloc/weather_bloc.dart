import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/data/models/weather_response.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = WeatherRepository();

  WeatherBloc() : super(WeatherEmpty()) {
    on<GetWeather>(_onGetWeather);
  }

  Future<void> _onGetWeather(
      GetWeather event, Emitter<WeatherState> emit) async {
    try {
      emit(WeatherLoading());
      final weatherData =
          await weatherRepository.getWeatherForLocation(event.cityName);
      emit(WeatherLoaded(weatherData));
    } catch (_) {
      emit(WeatherError());
    }
  }
}

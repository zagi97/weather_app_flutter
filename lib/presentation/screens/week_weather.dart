import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/waether_bloc/weather_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presentation/widgets/forecast_collection.dart';

class WeekWeather extends StatefulWidget {
  const WeekWeather({
    super.key,
    required this.cityName /* , required this.data */,
  });

  final String cityName;
  /*  final WeekWeatherResponse data; */

  @override
  State<WeekWeather> createState() {
    return _WeekWeatherState();
  }
}

class _WeekWeatherState extends State<WeekWeather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Week Weather in ${widget.cityName}',
            textAlign: TextAlign.center,
          ),
          backgroundColor: const Color.fromARGB(255, 5, 137, 211),
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Container(
                  height: 50,
                  color: Colors.amber[600],
                  child: Center(child: Text(widget.cityName)),
                ),
                Container(
                  color: Colors.amber[500],
                  child: const Center(
                          child: ForecastCollection(),
                  ),
                ),
                Container(
                  height: 50,
                  color: Colors.amber[100],
                  child: Center(
                    child: Text(
                      state.weekWeatherResponse?.forecast.forecastday[1].day
                              .mintemp_c
                              .toString() ??
                          'N/A',
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}

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
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            'Next 7 Days in ${widget.cityName}',
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 4, 7, 8),
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state.status == WeatherStatus.loading) {
              return const CircularProgressIndicator();
            }
            return Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    /*   Color.fromARGB(69, 228, 129, 15),
            Color.fromARGB(255, 254, 200, 136), */
                    Color.fromRGBO(253, 199, 157, 0.5),
                    Color.fromRGBO(254, 171, 81, 1)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 204, 193, 184),
                    ),
                    height: 200,
                    child: Center(child: Text(widget.cityName)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 212, 174, 142),
                    ),
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
              ),
            );
          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/waether_bloc/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/forecast_collection.dart';
import 'package:weather_app/presentation/widgets/forecast_tomorrow.dart';

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
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(247, 175, 121, 0.753),
                  Color.fromRGBO(254, 171, 81, 1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              text: 'Next 7 Days in ',
              style: const TextStyle(fontSize: 20, color: Colors.white),
              children: [
                TextSpan(
                  text: widget.cityName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 4, 7, 8),
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state.status == WeatherStatus.loading) {
              return Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(253, 199, 157, 0.5),
                      Color.fromRGBO(254, 171, 81, 1)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.black87),
                ),
              );
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
                children: const <Widget>[
                  ForecastTomorrow(),
                  Center(
                    child: ForecastCollection(),
                  ),
                  /* ), */
                ],
              ),
            );
          },
        ));
  }
}

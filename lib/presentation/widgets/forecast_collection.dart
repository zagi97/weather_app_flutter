import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/logic/waether_bloc/weather_bloc.dart';

class ForecastCollection extends StatelessWidget {
  const ForecastCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        final forecastList = state.weekWeatherResponse?.forecast.forecastday;

        if (forecastList != null && forecastList.isNotEmpty) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(200, 250, 233, 210),
            ),
            child: Column(
              children: forecastList.asMap().entries.map((entry) {
                final index = entry.key;
                final forecast = entry.value;
                final isLastItem = index == forecastList.length - 1;

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            DateFormat('EEEE')
                                .format(DateTime.parse(forecast.date)),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text('${forecast.day.maxtemp_c.toString()} °C'),
                          const SizedBox(width: 10),
                          Image.network(
                            'http:${forecast.day.condition_day.icon}',
                            width: 40,
                            height: 40,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                    if (!isLastItem)
                      Container(
                        height: 1,
                        color: const Color.fromARGB(255, 119, 15, 15),
                      ),
                  ],
                );
              }).toList(),
            ),
          );
        } else {
          return const Text('No forecast for selected week');
        }
      },
    );
  }
}

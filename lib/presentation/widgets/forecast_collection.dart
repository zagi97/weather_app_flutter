import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/waether_bloc/weather_bloc.dart';

class ForecastCollection extends StatelessWidget {
  const ForecastCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Column(
          children: state.weekWeatherResponse?.forecast.forecastday
                  .map(
                    (forecast) => Row(
                      children: [
                        Text(
                          forecast.day.maxtemp_c.toString() ?? 'N/A',
                        ),
                        const Spacer(),
                        Text(
                          forecast.day.mintemp_c.toString() ?? 'N/A',
                        ),
                      ],
                    ),
                  )
                  .toList() ??
              [const Text('No forecast for selected week')],
        );
      },
    );
  }
}

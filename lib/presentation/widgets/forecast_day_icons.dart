import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/waether_bloc/weather_bloc.dart';

class ForecastDayIcons extends StatelessWidget {
  const ForecastDayIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(172, 252, 224, 201),
                ),
                height: 60,
                /*   */
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(padding: EdgeInsets.fromLTRB(0, 0, 15, 0)),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: const Icon(
                        Icons.beach_access,
                        color: Colors.blue,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                    const Text('Rain'),
                    const Spacer(),
                    Text(
                      '${state.weatherResponse?.current.precipMm.toString()}cms',
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 0, 30, 0)),
                  ],
                )),
            const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(172, 252, 224, 201),
                ),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(padding: EdgeInsets.fromLTRB(0, 0, 15, 0)),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: const Icon(
                        Icons.wind_power,
                        color: Colors.blue,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                    const Text('Wind'),
                    const Spacer(),
                    Text(
                      '${state.weatherResponse?.current.windKph.toString()}km/h',
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 0, 30, 0)),
                  ],
                )),
            const Padding(padding: EdgeInsets.symmetric(vertical: 3)),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(172, 252, 224, 201),
                ),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(padding: EdgeInsets.fromLTRB(0, 0, 15, 0)),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: const Icon(
                        Icons.water_drop,
                        color: Colors.blue,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                    const Text('Humidity'),
                    const Spacer(),
                    Text(
                      '${state.weatherResponse?.current.humidity.toString()}%',
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(0, 0, 30, 0)),
                  ],
                )),
          ],
        );
      },
    );
  }
}

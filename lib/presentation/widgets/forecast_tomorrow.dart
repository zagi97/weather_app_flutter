import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/waether_bloc/weather_bloc.dart';

class ForecastTomorrow extends StatelessWidget {
  const ForecastTomorrow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 250, 233, 210),
            ),
            height: 170,
            child: Stack(children: [
              const Positioned(
                left: 20,
                top: 30,
                child: Text(
                  'Tomorrow',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                right: 80.0,
                top: 30.0,
                child: Text(
                  '${(state.weekWeatherResponse?.forecast.forecastday[1].day.maxtemp_c).toString()} °C ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                right: 10.0,
                top: 10.0,
                child: Image.network(
                  'http:${state.weekWeatherResponse?.forecast.forecastday[1].day.condition_day.icon ?? ''}',
                  width: 64,
                  height: 64,
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    Text(
                        '${state.weekWeatherResponse?.forecast.forecastday[1].day.totalprecip_mm.toString() ?? ''}cms'),
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
                    Text(
                        '${state.weekWeatherResponse?.forecast.forecastday[1].day.maxwind_kph.toString() ?? ''}km/h'),
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
                    Text(
                        '${state.weekWeatherResponse?.forecast.forecastday[1].day.avghumidity.toString() ?? ''}%'),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}

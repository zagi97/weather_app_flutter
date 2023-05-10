import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/screens/week_weather.dart';
import 'package:weather_app/presentation/widgets/forecast_day_icons.dart';

import '../../logic/waether_bloc/weather_bloc.dart';

class Search extends StatelessWidget {
  const Search(
      {super.key, required this.searchController, required this.state});

  final TextEditingController searchController;
  final WeatherState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      //OVO MOŽDA NIJE PRAVO RJEŠENJE NITI TOČNO
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
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  primaryColor: Colors.redAccent,
                ),
                child: TextField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    hintText:
                        'Enter the name of the place for weather forecast',
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        context
                            .read<WeatherBloc>()
                            .add(GetWeather(searchController.text));
                      },
                    ),
                    prefixIconColor: MaterialStateColor.resolveWith((states) =>
                        states.contains(MaterialState.focused)
                            ? Colors.black
                            : Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state.status == WeatherStatus.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state.status == WeatherStatus.failure) {
                    /*  return Search(searchController: searchController, state: state); */
                    return const Center(child: Text('Failure'));
                  }
                  if (state.status == WeatherStatus.initial) {
                    /*  return Search(searchController: searchController, state: state); */
                    return const Center(
                        child: Text('Please enter valid place'));
                  }

                  return Column(
                    children: [
                      Text(
                        state.weatherResponse?.location.name ?? 'N/A',
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(
                        '${state.weatherResponse?.location.country}',
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(
                        state.weatherResponse?.location.localTime ?? '',
                        //OVO ISPOD JE DOBAR KOD
                        //+++++++++++++++++++++++
                        /*  DateFormat('EEE, MMM d').format(DateTime.parse(
                              state.weatherResponse?.current.lastUpdated ??
                                  '')) */
                      ),
                      Text(
                        '${state.weatherResponse?.current.tempInCelsius.toString()} °C',
                        style: const TextStyle(fontSize: 50),
                      ),
                      Text(
                        state.weatherResponse?.current.condition
                                .conditionName ??
                            'N/A',
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ForecastDayIcons(),
                      const SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: ElevatedButton(
                          child: const Text(
                            'Week Weather',
                            style: TextStyle(
                                color: Color.fromARGB(255, 27, 25, 20)),
                          ),
                          onPressed: () {
                            context.read<WeatherBloc>().add(
                                GetWeekWeatherForLocation(
                                    searchController.text));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WeekWeather(
                                    cityName:
                                        state.weatherResponse?.location.name ??
                                            'N/A'),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

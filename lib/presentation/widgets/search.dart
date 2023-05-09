import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presentation/screens/week_weather.dart';

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
              /*   const Text(
                    'Upišite ime željenog mjesta',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ), */
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

                    // Add a search icon or button to the search bar
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        context
                            .read<WeatherBloc>()
                            .add(GetWeather(searchController.text));

                        //searchController.clear();
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
                      /*   state.weatherResponse?.location.localTime ?? '', */
                        //OVO ISPOD JE DOBAR KOD
                        //+++++++++++++++++++++++
                         DateFormat('EEE, MMM d').format(DateTime.parse(
                              state.weatherResponse?.current.lastUpdated ?? ''))
                        //+++++++++++++++++++++++
                        /*  DateFormat('yyyy-MM-dd H:mm').format(DateTime.parse(
                        '${state.weatherResponse?.location.localTime}')),
                    style: const TextStyle(fontSize: 15), */
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
                      Image.network(
                          'http:${state.weatherResponse?.current.condition.icon ?? ''}',
                          width: 128,
                          height: 128,
                          fit: BoxFit.fill
                          /*     errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Text('Image not available');
                    }, */
                          ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
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
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 0, 15, 0)),
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
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 0, 0)),
                                  const Text('Rain'),
                                  const Spacer(),
                                  Text(
                                    '${state.weatherResponse?.current.precipMm.toString()}cms',
                                  ),
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 0, 30, 0)),
                                ],
                              )),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 3)),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(172, 252, 224, 201),
                              ),
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 0, 15, 0)),
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
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 0, 0)),
                                  const Text('Wind'),
                                  const Spacer(),
                                  Text(
                                    '${state.weatherResponse?.current.windKph.toString()}km/h',
                                  ),
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 0, 30, 0)),
                                ],
                              )),
                          const Padding(
                              padding: EdgeInsets.symmetric(vertical: 3)),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color.fromARGB(172, 252, 224, 201),
                              ),
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 0, 15, 0)),
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
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 0, 0)),
                                  const Text('Humidity'),
                                  const Spacer(),
                                  Text(
                                    '${state.weatherResponse?.current.humidity.toString()}%',
                                  ),
                                  const Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 0, 30, 0)),
                                ],
                              )),
                        ],
                      ),
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

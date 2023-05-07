import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/waether_bloc/weather_bloc.dart';

class Search extends StatelessWidget {
  const Search(
      {super.key, required this.searchController, required this.state});

  final TextEditingController searchController;
  final WeatherState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 5, 137, 211),
            Color.fromARGB(255, 55, 184, 243),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*  const Text(someFunction()),  */
            const Text(
              'Upišite ime željenog mjesta',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
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
                  hintText: 'Enter the name of the place for weather forecast',
                  hintStyle: const TextStyle(color: Colors.white),

                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      context
                          .read<WeatherBloc>()
                          .add(GetWeather(searchController.text));

                      searchController.clear();
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
            Text(state.weatherResponse?.location.name ?? ''),
            Text(state.weatherResponse?.current.tempInCelsius.toString() ?? ''),
            /*  Text(state.weatherResponse?.forecast.forecastDay.date ?? ''), */
          ],
        ),
      ),

      /*  Text(state.weatherResponse!.location.name),
       Text(state.weatherResponse!.current.tempInCelsius.toString()),  */
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/waether_bloc/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext homeScreencontext) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather Forecast',
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 5, 137, 211),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.status == WeatherStatus.initial) {
            return Search(searchController: searchController, state: state);
          }
          if (state.status == WeatherStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == WeatherStatus.loaded) {
            return Search(searchController:  searchController, state: state);
          }
          if (state.status == WeatherStatus.failure) {
            /*  return Search(searchController: searchController, state: state); */
            return const Center(child: Text('Failure'));
          }

          return Container();
        },
      ),
    );
  }
}

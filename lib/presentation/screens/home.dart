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
      /* appBar: AppBar(
        title: const Text(
          'Weather Forecast',
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 5, 137, 211),
      ), */
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.status == WeatherStatus.initial) {
            return Search(searchController: searchController, state: state);
          }
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
          if (state.status == WeatherStatus.loaded) {
            return Search(searchController: searchController, state: state);
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

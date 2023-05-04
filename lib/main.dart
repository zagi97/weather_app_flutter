import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repositories/weather_repository.dart';
import 'package:weather_app/logic/waether_bloc/weather_bloc.dart';

import 'package:weather_app/presentation/screens/home.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherBloc(),
      child: MaterialApp(
          //title: 'Flutter Demo',
          theme: theme,
          home:
              const HomeScreen() /* BlocProvider(
            create: (context) => WeatherBloc(WeatherRepository()),
            child: const HomeScreen(),
          ) */
          ),
    );
  }
}

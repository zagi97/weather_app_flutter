class Astro {
  const Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
  });

  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;

  factory Astro.fromJson(Map<String, dynamic> jsonWeather) => Astro(
      sunrise: jsonWeather['sunrise'],
      sunset: jsonWeather['sunset'],
      moonrise: jsonWeather['moonrise'],
      moonset: jsonWeather['moonset']);
}

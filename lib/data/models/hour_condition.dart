class HourCondition {
  const HourCondition({
    required this.text,
    required this.icon,
  });

  final String text;
  final String icon;

  factory HourCondition.fromJson(Map<String, dynamic> jsonWeather) =>
      HourCondition(
        text: jsonWeather['text'],
        icon: jsonWeather['icon'],
      );
}

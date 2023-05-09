class DayCondition {
  DayCondition({
    required this.text,
    required this.icon,
  });

  final String text;
  final String icon;

  factory DayCondition.fromJson(Map<String, dynamic> jsonWeather) =>
      DayCondition(
        text: jsonWeather['text'],
        icon: jsonWeather['icon'],
      );
}

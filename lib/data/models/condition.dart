class Condition {
  const Condition({required this.conditionName, required this.icon});

  final String conditionName;
  final String icon;

  factory Condition.fromJson(Map<String, dynamic> jsonWeather) => Condition(
        conditionName: jsonWeather['text'],
        icon: jsonWeather['icon'],
      );
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Location {
  Location(
      {required this.name,
      required this.region,
      required this.country,
      required this.lat,
      required this.lng,
      required this.timeZone,
      required this.localTime});

  final String name;
  final String region;
  final String country;
  final int lat;
  final int lng;
  final String timeZone;
  final String localTime;

  factory Location.fromJson(Map<String, dynamic> jsonWeather) => Location(
        name: jsonWeather["name"],
        region: jsonWeather["region"],
        country: jsonWeather["country"],
        lat: jsonWeather["lat"],
        lng: jsonWeather["lon"],
        timeZone: jsonWeather["tz_id"],
        localTime: jsonWeather["localtime"],
      );
}

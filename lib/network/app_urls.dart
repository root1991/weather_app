import 'package:weather_app/api_key.dart';

class AppUrls {
  String get baseUrl => 'https://api.openweathermap.org/data/2.5/forecast';

  String weatherForecast(double lon, double lat) =>
      '$baseUrl/?appid=$apiKey&lat=$lat&lon=$lon&exclude=hourly,daily&units=metric';
}
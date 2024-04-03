class WeatherForecast {
  final String date;
  final double temperature;
  final double humidity;
  final double wind;
  final double pressure;
  final double cloudiness;
  final WeatherCondition weatherCondition;

  WeatherForecast({
    required this.date,
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.pressure,
    required this.cloudiness,
    required this.weatherCondition,
  });

  @override
  String toString() {
    return 'Forecast(date: $date, temperature: ${temperature.toStringAsFixed(2)}, humidity: $humidity, wind: ${wind.toStringAsFixed(2)}, pressure: $pressure, cloudiness: $cloudiness%)';
  }
}

enum WeatherCondition {
  sun,
  cloud,
  rain,
  partiallyCloudy,
  snow,
}

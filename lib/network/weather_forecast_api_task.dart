import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:weather_app/network/app_urls.dart';
import 'package:weather_app/network/weather_forecast.dart';

class WeatherForecastApiTask {
  final AppUrls _appUrls;
  final Dio _dio;

  WeatherForecastApiTask({
    required AppUrls appUrls,
    required Dio dio,
  })  : _appUrls = appUrls,
        _dio = dio;

  Future<List<WeatherForecast>> loadWeatherForecast(
    double lon,
    double lat,
  ) async {
    final response = await _dio.get(_appUrls.weatherForecast(lon, lat));
    if (response.statusCode == 200) {
      if (response.data['list'] is List &&
          (response.data['list'] as List).isNotEmpty) {
        Map<String, List<WeatherForecast>> groupedForecasts = {};
        for (var item in response.data['list']) {
          String date =
              item['dt_txt'].substring(0, 10); // Extracting the date part
          WeatherForecast forecast = WeatherForecast(
              date: date,
              temperature: (item['main']['temp'] as num).toDouble(),
              humidity: (item['main']['humidity'] as num).toDouble(),
              wind: (item['wind']['speed'] as num).toDouble(),
              pressure: (item['main']['pressure'] as num).toDouble(),
              cloudiness: (item['clouds']['all'] as num).toDouble(),
              weatherCondition:
                  _parseWeatherCondition(item['weather'][0]['main']));

          if (!groupedForecasts.containsKey(date)) {
            groupedForecasts[date] = [];
          }
          groupedForecasts[date]!.add(forecast);
        }

        List<WeatherForecast> averagedForecasts = [];
        groupedForecasts.forEach((date, forecasts) {
          double avgTemp =
              forecasts.map((f) => f.temperature).reduce((a, b) => a + b) /
                  forecasts.length;
          double avgHumidity =
              forecasts.map((f) => f.humidity).reduce((a, b) => a + b) /
                  forecasts.length;
          double avgWind =
              forecasts.map((f) => f.wind).reduce((a, b) => a + b) /
                  forecasts.length;
          double avgPressure =
              forecasts.map((f) => f.pressure).reduce((a, b) => a + b) /
                  forecasts.length;
          double avgCloudiness =
              forecasts.map((f) => f.cloudiness).reduce((a, b) => a + b) /
                  forecasts.length;
          WeatherCondition avgWeatherCondition =
              _determineMostFrequentCondition(forecasts);

          averagedForecasts.add(WeatherForecast(
            date: date,
            temperature: avgTemp,
            humidity: avgHumidity,
            wind: avgWind,
            pressure: avgPressure,
            cloudiness: avgCloudiness,
            weatherCondition: avgWeatherCondition,
          ));
        });
        return averagedForecasts;
      }
    }
    return [];
  }

  WeatherCondition _parseWeatherCondition(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
        return WeatherCondition.sun;
      case 'clouds':
        return WeatherCondition.cloud;
      case 'rain':
        return WeatherCondition.rain;
      case 'snow':
        return WeatherCondition.snow;
      default:
        return WeatherCondition.partiallyCloudy;
    }
  }

  WeatherCondition _determineMostFrequentCondition(List<WeatherForecast> forecasts) {
    var conditionCounts = SplayTreeMap<WeatherCondition, int>(
        (a, b) => b.index.compareTo(a.index));
    for (var forecast in forecasts) {
      conditionCounts.update(forecast.weatherCondition, (value) => value + 1,
          ifAbsent: () => 1);
    }

    var sortedConditions = conditionCounts.entries.toList()
      ..sort((a, b) {
        int compareCount = b.value.compareTo(a.value);
        if (compareCount == 0) {
          return a.key.index.compareTo(b.key.index);
        }
        return compareCount;
      });

    return sortedConditions.first.key;
  }
}

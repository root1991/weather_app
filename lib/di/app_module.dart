import 'package:dio/dio.dart';
import 'package:weather_app/network/app_urls.dart';
import 'package:weather_app/network/weather_forecast_api_task.dart';

class AppModule {
  late final AppUrls _appUrls;
  late final Dio _dio;
  late final WeatherForecastApiTask weatherForecastApiTask;

  void initDependencies() {
    _appUrls = AppUrls();
    _dio = Dio();
    weatherForecastApiTask = WeatherForecastApiTask(
      appUrls: _appUrls,
      dio: _dio,
    );
  }
}

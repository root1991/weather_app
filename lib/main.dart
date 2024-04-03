import 'package:flutter/material.dart';
import 'package:weather_app/di/app_module.dart';
import 'package:weather_app/weather_app.dart';

void main() {
  final appModule = AppModule();
  appModule.initDependencies();

  runApp(
    WeatherApp(
      appModule: appModule,
    ),
  );
}

// 3. else -> show permission widget
import 'package:equatable/equatable.dart';

abstract class WeatherForecastEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckLocationPermissionEvent extends WeatherForecastEvent {}

class LoadWeatherForecastEvent extends WeatherForecastEvent {}

class RequestLocationPermissionEvent extends WeatherForecastEvent {}

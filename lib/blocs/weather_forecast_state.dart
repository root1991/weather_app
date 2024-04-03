import 'package:equatable/equatable.dart';
import 'package:weather_app/network/weather_forecast.dart';

class WeatherForecastState extends Equatable {
  final bool isLoading;
  final PermissionState permissionState;
  final List<WeatherForecast> weatherForecasts;

  const WeatherForecastState({
    this.weatherForecasts = const [],
    this.isLoading = false,
    this.permissionState = PermissionState.declined,
  });

  @override
  List<Object?> get props => [weatherForecasts, isLoading, permissionState];

  WeatherForecastState copyWith({
    List<WeatherForecast>? weatherForecasts,
    bool? isLoading,
    PermissionState? permissionState,
  }) {
    return WeatherForecastState(
      weatherForecasts: weatherForecasts ?? this.weatherForecasts,
      isLoading: isLoading ?? this.isLoading,
      permissionState: permissionState ?? this.permissionState,
    );
  }
}

enum PermissionState { granted, declined }

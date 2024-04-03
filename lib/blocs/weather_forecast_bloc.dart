import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/blocs/weather_forecast_event.dart';
import 'package:weather_app/blocs/weather_forecast_state.dart';
import 'package:weather_app/network/weather_forecast_api_task.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  WeatherForecastBloc({required this.weatherForecastApiTask})
      : super(const WeatherForecastState()) {
    on<CheckLocationPermissionEvent>(_checkLocationPermission);
    on<RequestLocationPermissionEvent>(_requestLocationPermission);
    on<LoadWeatherForecastEvent>(_loadWeatherForecast);
  }

  final WeatherForecastApiTask weatherForecastApiTask;

  FutureOr<void> _checkLocationPermission(
    CheckLocationPermissionEvent event,
    Emitter<WeatherForecastState> emit,
  ) async {
    var status = await Permission.location.status;

    if (status.isGranted) {
      add(LoadWeatherForecastEvent());
    } else {
      emit(
        state.copyWith(permissionState: PermissionState.declined),
      );
    }
  }

  FutureOr<void> _requestLocationPermission(
    RequestLocationPermissionEvent event,
    Emitter<WeatherForecastState> emit,
  ) async {
    var status = await Permission.location.request();

    if (status.isGranted) {
      add(LoadWeatherForecastEvent());
    } else {
      emit(
        state.copyWith(permissionState: PermissionState.declined),
      );
    }
  }

  Future<FutureOr<void>> _loadWeatherForecast(
    LoadWeatherForecastEvent event,
    Emitter<WeatherForecastState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true),
    );

    final location = Location();
    final locationData = await location.getLocation();

    final weatherForecasts = await weatherForecastApiTask.loadWeatherForecast(
      locationData.longitude ?? 0.0,
      locationData.latitude ?? 0.0,
    );
    emit(
      state.copyWith(
        isLoading: false,
        weatherForecasts: weatherForecasts,
        permissionState: PermissionState.granted,
      ),
    );
  }
}

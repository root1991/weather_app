import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:weather_app/blocs/weather_forecast_bloc.dart';
import 'package:weather_app/blocs/weather_forecast_state.dart';
import 'package:weather_app/network/weather_forecast.dart';
import 'package:weather_app/presentation/widgets/loading_widget.dart';
import 'package:weather_app/presentation/widgets/weather_forecast_widget.dart';

import 'widgets/location_permission_widget.dart';

class WeatherForecastScreen extends StatelessWidget {
  const WeatherForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<WeatherForecastBloc>(context);

    return BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
        builder: (context, state) {
      return Scaffold(
        body: _stateToWidget(state, bloc),
      );
    });
  }

  Widget _stateToWidget(WeatherForecastState state, WeatherForecastBloc bloc) {
    if (state.isLoading) {
      return const LoadingWidget();
    }
    if (state.permissionState == PermissionState.granted) {
      return WeatherForecastWidget(forecasts: state.weatherForecasts);
    } else {
      return PermissionWidget(bloc: bloc);
    }
  }
}

Icon getWeatherIcon(WeatherCondition condition, double size) {
  return switch (condition) {
    WeatherCondition.sun => Icon(
        Ionicons.sunny,
        size: size,
        color: Colors.yellow,
      ),
    WeatherCondition.cloud => Icon(
        Ionicons.cloud,
        size: size,
        color: Colors.blueGrey.shade400,
      ),
    WeatherCondition.rain => Icon(
        Ionicons.rainy,
        size: size,
        color: Colors.blue.shade400,
      ),
    WeatherCondition.partiallyCloudy => Icon(
        Ionicons.partly_sunny,
        size: size,
        color: Colors.blue.shade400,
      ),
    WeatherCondition.snow => Icon(
        Ionicons.snow,
        size: size,
        color: Colors.white,
      ),
  };
}

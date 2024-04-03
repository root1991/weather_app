import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/blocs/weather_forecast_bloc.dart';
import 'package:weather_app/blocs/weather_forecast_event.dart';
import 'package:weather_app/di/app_module.dart';
import 'package:weather_app/presentation/weather_forecast_screen.dart';
import 'package:weather_app/styles.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key, required this.appModule});

  final AppModule appModule;

  GoRouter getRouter(AppModule appModule) {
    return GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => WeatherForecastBloc(
            weatherForecastApiTask: appModule.weatherForecastApiTask,
          )..add(CheckLocationPermissionEvent()),
          child: const WeatherForecastScreen(),
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var router = getRouter(appModule);

    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        theme: weatherAppThemeData,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
        routeInformationParser: router.routeInformationParser,
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/network/weather_forecast.dart';
import 'package:weather_app/presentation/weather_forecast_screen.dart';

class WeatherForecastDayCard extends StatelessWidget {
  const WeatherForecastDayCard({
    super.key,
    required this.forecast,
  });

  final WeatherForecast forecast;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('E').format(DateTime.parse(forecast.date)),
                style: TextStyle(fontSize: 12.sp),
              ),
              getWeatherIcon(forecast.weatherCondition, 30),
              Text(
                '${forecast.temperature.toStringAsFixed(1)} °C',
                style: TextStyle(fontSize: 12.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
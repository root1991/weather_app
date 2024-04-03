import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/network/weather_forecast.dart';
import 'package:weather_app/presentation/weather_forecast_screen.dart';
import 'package:weather_app/presentation/widgets/weather_forecast_icon.dart';

class WeatherForecastWidget extends StatelessWidget {
  const WeatherForecastWidget({super.key, required this.forecasts});

  final List<WeatherForecast> forecasts;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 3.h),
        scrollDirection: Axis.vertical,
        itemCount: forecasts.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 2.h),
                Center(
                  child: Text(
                    DateFormat('EEEE').format(
                      DateTime.parse(forecasts[0].date),
                    ),
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Card(
                    elevation: 5,
                    child: Column(children: [
                      SizedBox(height: 2.h),
                      getWeatherIcon(forecasts[0].weatherCondition, 100),
                      Text(
                        '${forecasts[0].temperature.toStringAsFixed(1)} °C',
                        style: TextStyle(
                            fontSize: 55.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Humidity: ${forecasts[0].humidity.toStringAsFixed(1)} %',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        'Pressure: ${forecasts[0].pressure.toStringAsFixed(1)} hPa',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        'Wind: ${forecasts[0].wind.toStringAsFixed(1)} m/s',
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 2.h),
                    ]),
                  ),
                ),
                SizedBox(height: 3.h)
              ],
            );
          }
          return WeatherForecastDayCard(
            forecast: forecasts[index],
          );
        },
      ),
    );
  }
}
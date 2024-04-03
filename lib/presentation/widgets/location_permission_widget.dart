import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/blocs/weather_forecast_bloc.dart';
import 'package:weather_app/blocs/weather_forecast_event.dart';

class PermissionWidget extends StatelessWidget {
  const PermissionWidget({super.key, required this.bloc});

  final WeatherForecastBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.location_on,
                size: 100,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              'Please give us location permission to get your weather forecast',
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w300,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            GestureDetector(
              onTap: () => bloc.add(RequestLocationPermissionEvent()),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Grant permission',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 18.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

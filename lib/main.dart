// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/weather_services.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherServices());
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch:
              BlocProvider.of<WeatherCubit>(context).weatherModel == null
                  ? Colors.blue
                  : BlocProvider.of<WeatherCubit>(context)
                      .weatherModel!
                      .getColor()),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Provider.of<WeatherProvider>(context).WeatherDate ==
                  null
              ? Colors.blue
              : Provider.of<WeatherProvider>(context).WeatherDate!.getColor()),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherDate;
  @override
  Widget build(BuildContext context) {
    weatherDate = Provider.of<WeatherProvider>(context).WeatherDate;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchScreen(
                    updateUi: updateUi,
                  );
                }));
              },
              icon: Icon(Icons.search)),
        ],
        title: const Text('Weather App'),
      ),
      body: weatherDate == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherDate!.getColor(),
                weatherDate!.getColor()[50]!,
              ], end: Alignment.bottomCenter, begin: Alignment.topCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'updated: ${DateTime.now().day}/${DateTime.now().month}-${DateTime.now().hour}:${DateTime.now().minute}',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherDate!.getImage()),
                      Text(
                        '${weatherDate!.temp.toInt()}',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text('maxTem:${weatherDate!.maxTemp.toInt()}'),
                          Text('minTem:${weatherDate!.minTemp.toInt()}'),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherDate?.weatherStateName ?? '',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
    );
  }
}

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'temp': temp,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'weatherStateName': weatherStateName,
    };
  }

  factory WeatherModel.fromMap(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['locationtime'],
        temp: jsonData['maxtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
}

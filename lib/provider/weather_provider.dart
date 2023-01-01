import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherDate;
  String? cityName;
  set weaherData(WeatherModel weather) {
    _weatherDate = weather;
    notifyListeners();
  }

  WeatherModel? get WeatherDate => _weatherDate;
}

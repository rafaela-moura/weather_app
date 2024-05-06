import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/together.dart';
import 'package:weather_app/service/open_weather.dart';

class HomeViewModel {
  Together? together;
  String city = "Serra Talhada";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<Together?> getTemp() async {
    return together = await OpenWeatherService().getWeatherToken(city);
  }

  setCity(String? value) {
    city = value!;
  }
}

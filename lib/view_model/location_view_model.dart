

import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/together.dart';
import 'package:weather_app/service/open_weather.dart';
import 'package:weather_app/view_model/base_view_model.dart';

class LocationViewModel extends BaseViewModel {
  Together? together;
  String city = "Serra Talhada";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onInit(BuildContext context) async {

  }

  Future<Together?> getTemp() async {
    return together = await OpenWeatherService().getWeatherToken(city);

  }

  setCity(String? value) {
    city = value!;
    notifyListeners();
  }
}

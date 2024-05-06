import 'package:dio/dio.dart';
import 'package:weather_app/model/together.dart';

class OpenWeatherService {
  final String key = "1d453b9f49d59054700d46c98db4e7f0";

  Future<Together?> getWeatherToken(String cidade) async {
    final Dio dio = Dio();
    try {
      Response response = await dio.get(
          "https://api.openweathermap.org/data/2.5/weather?q=$cidade&appid=$key",
          options: Options(contentType: "application/json"));

      if (response.statusCode == 200) {
        return Together.fromJson(response.data);
      }
    } on DioException catch (_) {}
    return null;
  }
}

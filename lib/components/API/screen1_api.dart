import 'dart:convert';
import 'package:http/http.dart' as http;
import 'screen1_class.dart';

class WeatherService {
  static Future<Weather> fetchWeatherData(String location) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8080/readings'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

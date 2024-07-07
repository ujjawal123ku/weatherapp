import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherService {
  static const String apiKey = 'f386c03bc3ef5f537972fa9e500b1540';
  static const String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String cityName) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?q=$cityName&appid=$apiKey'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Weather.fromJson(data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      throw Exception('Failed to fetch weather data: $error');
    }
  }
}

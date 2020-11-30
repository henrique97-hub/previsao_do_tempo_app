import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather.dart';

  Future<Weather> getWeather() async {
    final String url = 'https://api.hgbrasil.com/weather?key=859bf422';
    final response = await http.get(url);

    if(response.statusCode == 200){
      return Weather.fromJson(json.decode(response.body));

    }
    else {
      throw Exception("Algo deu errado");
    }
  }


// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

//Weather Api
//https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={long}&appid=cec9ce5ba249aac252bd3f3cdd349036

class ApiService {
  Future getWeatherDetails(double? lat, double? long) async {
    try {
      String mainUrl =
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=cec9ce5ba249aac252bd3f3cdd349036';

      var response = await http.post(Uri.parse(mainUrl));

      var responseJson =
          Map<String, dynamic>.from(json.decode(response.body.toString()));

      // print("responseJson:--" + responseJson.toString());

      return responseJson;
    } catch (e) {
      print('error:--' + e.toString());
    }
  }
}

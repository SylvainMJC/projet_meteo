

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class WeatherData {
  final DateTime day;
  final String city;
  final String mainWeather;
  final double temperature;
  final String icon;
  // final Map<String, dynamic> data;

  WeatherData(
    this.day, this.city, this.mainWeather, this.temperature, this.icon
    // this.data
    );

  WeatherData.fromJson(Map<String, dynamic> json)
    // : data = json;
    : day = DateTime.fromMillisecondsSinceEpoch(json['dt']*1000),
      city = json['name'],
      mainWeather = json['weather'][0]['description'],
      temperature = roundDouble(json['main']['temp'], 1),
      icon = 'https://openweathermap.org/img/wn/${json["weather"][0]["icon"]}@4x.png';

  

  String toString(){
    return '{ day: $day, city: $city, mainWeather: $mainWeather, temperature: $temperature, icon: $icon }';
    //return '{data : $data}';

  }
}

double roundDouble(double value, int places){ 
    double mod = pow(10.0, places); 
    return ((value * mod).round().toDouble() / mod); 
  }
// Future<void> main() async {
//   var url ='http://localhost:8000';
//   var response = await http.read(url + '/data.json');
//   final parsed = json.decode(response);
//   print('a = ${parsed['a']}');
//   print('b = ${parsed['b']}');

//   var res = Result.fromJson(parsed);
//   print('res = $res');
  
// }


// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class WeatherData {
//   final int a;
//   final String b;

//   WeatherData(this.a, this.b);

//   WeatherData.fromJson(Map<String, dynamic> json)
//     : a = json['a'],
//       b = json['b'];


//   String toString(){
//     return '{ a: $a, b: $b }';
//   }
// }


// Future<void> main() async {
//   var url ='http://localhost:8000';
//   var response = await http.read(url + '/data.json');
//   final parsed = json.decode(response);
//   print('a = ${parsed['a']}');
//   print('b = ${parsed['b']}');

//   var res = Result.fromJson(parsed);
//   print('res = $res');
  
// }
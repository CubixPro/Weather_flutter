import 'package:http/http.dart' as http;
import 'dart:async';
import 'post.dart';
import 'dart:io';

String url = 'https://api.openweathermap.org/data/2.5/weather?id=';
String url0 = '&appid=d8da757298616032616a3fcf82cf6357';

String url2 =
    'https://api.openweathermap.org/data/2.5/weather?id=2172797&appid=7c55e59016fc17a150a090b612370684';
String url3 = 'https://samples.openweathermap.org/data/2.5/weather?q=';
Future<Weather> getPost(int city) async {
  print('$url$city$url0');
  final response = await http.get('$url$city$url0');

  //print('$url3$city&appid=7c55e59016fc17a150a090b612370684');
  return weatherFromJson(response.body);
}

Future<Weather> getPost2() async {
  final response = await http.get('$url2/1');
  return weatherFromJson(response.body);
}

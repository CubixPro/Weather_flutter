import 'package:flutter/material.dart';

import 'WeatherData.dart';
import 'post.dart';

class WeatherItem extends StatelessWidget {
  final Weather weather;

  WeatherItem({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(weather.name, style: new TextStyle(color: Colors.black)),
            Text(weather.weather[0].description, style: new TextStyle(color: Colors.black, fontSize: 24.0)),
            Text('${weather.main.temp.toString()}°F',  style: new TextStyle(color: Colors.black)),
            Image.network('https://openweathermap.org/img/w/${weather.weather[0].icon}.png'),
          ],
        );
  }
}
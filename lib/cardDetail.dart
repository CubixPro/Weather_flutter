import 'package:flutter/material.dart';

class Cardrint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("London", style: new TextStyle(color: Colors.black)),
        Text('Drizzle',
            style: new TextStyle(color: Colors.black, fontSize: 24.0)),
        Text('30.0'.toString(), style: new TextStyle(color: Colors.black)),
        Image.network('https://openweathermap.org/img/w/01d.png'),
        Text('light intensity drizzle',
            style: new TextStyle(color: Colors.black)),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'post.dart';
import 'services.dart';
import 'weatherdata.dart';
import 'weatheritem.dart';

List ids = [1275004];
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue[800],
          primaryColorBrightness: Brightness.dark),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherData weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[200],
          title:
              Text('Weather Tiles', style: new TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.pink[100],
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          height: 200,
                          width: 200,
                          child: Card(
                              color: Colors.white,
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(children: <Widget>[
                                    Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: FutureBuilder<Weather>(
                                          future: getPost(ids[0]),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.done) {
                                              return (snapshot.data!=null)?WeatherItem(
                                                weather: snapshot.data,
                                              ):Container();
                                            } else
                                              return Padding(
                                                  padding:
                                                      const EdgeInsets.all(50),
                                                  child:
                                                      CircularProgressIndicator());
                                          },
                                        ))
                                  ])))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: new Icon(Icons.refresh),
                          tooltip: 'Refresh',
                          onPressed: () => null,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ]))
        ])));
  }
}

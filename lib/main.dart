import 'package:flutter/material.dart';
import 'post.dart';
import 'services.dart';
import 'weatherdata.dart';
import 'weatheritem.dart';

List ids = [1275004, 6058560, 5128638];
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
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
        title: Text('Weather Tiles'),
      ),
      body:         ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ids.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 200,
              width: 200,
              child:
          
   Card(
                color: Colors.white,
                child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(8),
                          child: FutureBuilder<Weather>(
                            future: getPost(ids[index]),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return snapshot.data!=null?WeatherItem(
                                  weather: snapshot.data,
                                ):Container();
                              } else
                                return Padding(
                                    padding: const EdgeInsets.all(50),
                                    child: CircularProgressIndicator());
                            },
                          ))
                    ]))));
          }),
          
      ); 
  }
}

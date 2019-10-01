import 'package:flutter/material.dart';
import 'Widgets/SearchRoute.dart';
import 'Widgets/weatheritem.dart';
import 'Services/services.dart';
import 'Models/weather.dart';
import 'Models/weatherdata.dart';

List
    /*ids = [
  1275004,
  5128638,
  1273294,
  1850147,
  2038349,
  5368361,
  4254884,
  524901,
  2950159,
  6455259,
  2761369
]*/
    ids = ['Kolkata'];
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.cyan[800],
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
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Weather Tiles'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        // Add box decoration
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ],
          ),
        ),
        child: Center(
          child: Column(children: <Widget>[
            Container(
              height: 550,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ids.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 400,
                            child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              new BorderRadius.circular(7),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.cyan[100],
                                                  Colors.cyan[200], 
                                                  Colors.cyan[300]
                                                ],
                                                tileMode: TileMode.clamp,
                                              ),

                                         // backgroundBlendMode: BlendMode.color,
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5),
                                                child: FutureBuilder<Weather>(
                                                  future: getPost(ids[index]),
                                                  builder: (context, snapshot) {
                                                    if (snapshot
                                                            .connectionState ==
                                                        ConnectionState.done) {
                                                      return snapshot.data !=
                                                              null
                                                          ? WeatherItem(
                                                              weather:
                                                                  snapshot.data,
                                                            )
                                                          : Container(
                                                              height: 110,
                                                              width: 100,
                                                              child: Center(
                                                                  child: Column(
                                                                      children: <
                                                                          Widget>[
                                                                    Text(ids[
                                                                        index]),
                                                                    Text(
                                                                      'Not found',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    )
                                                                  ])),
                                                            );
                                                    } else
                                                      return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(50),
                                                          child:
                                                              CircularProgressIndicator());
                                                  },
                                                ),
                                              ),
                                              IconButton(
                                                icon:
                                                    Icon(Icons.favorite_border),
                                                color: Colors.red,
                                                onPressed: () {},
                                              ),
                                              Container(
                                                height: 250,
                                                width: 200,
                                                child: Card(
                                                  semanticContainer: true,
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  //color: Colors.black,
                                                  child: new Image.asset(
                                                    '../assets/image.jpg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  elevation: 5,
                                                  margin: EdgeInsets.all(10),
                                                ),
                                              )
                                            ]))),
                                  )
                                ])));
                      })),
            ),
            RaisedButton(
              child: Text('Remove a city tile'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyRoute(
                            action: -1,
                          )),
                );
              },
            ),

            /*Center(child:
       Padding(
         padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
         child:Container(
         height:100,
         width:500,
         child: Card(child: Align(
            alignment: Alignment(0,0),
           child:Text('Do you know how to use this app?',
          style: TextStyle(fontStyle: FontStyle.italic,
           ), ),))),
       )),*/
            /*ButtonBar(children: <Widget>[
         RaisedButton(child:Text('yes'),
         color: Colors.red[500],
         onPressed: (){
           return AlertDialog(
             title: Text('So proud omfg')
           );
         },),
         
        RaisedButton(child:Text('no'),
        color: Colors.red[500],
        onPressed: (){
          return showDialog( 
            context: context,
            builder: (BuildContext context){return AlertDialog(title: Text(
            'Its really easy'
          ),);});
        },)
       ],)*/
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyRoute(
                      action: 1,
                    )),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add a new city',
      ),
    );
  }
}

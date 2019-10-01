import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Form.dart';

class MyRoute extends StatelessWidget {
  final int action;//action 1 is add, action -1 is remove
  MyRoute({@required this.action});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[300],
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.pink[300],
          title: Text('Search'),
        ),
        body: SingleChildScrollView(child: Center(
            child: Column(children: <Widget>[
          RaisedButton(
              child: Text('Go back'),
              onPressed: () {
                Navigator.pop(context);
              }),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
                color: Colors.indigo[100],
                child: Padding(
                    padding: const EdgeInsets.all(25), child: MyCustomForm(action2: action,))),
          ),
          
        ]))));
  }
}

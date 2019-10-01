import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Form.dart';

String findTitle(int num) {
  if (num == 1) {
    return 'Search Bar';
  } else
    return 'Remove Bar';
}

class MyRoute extends StatelessWidget {
  final int action; //action 1 is add, action -1 is remove
  MyRoute({@required this.action, text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[300],
        //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Text(
              findTitle(action),
              style: TextStyle(color: Colors.black),
            )),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child:
          RaisedButton(
              child: Text('Go back'),
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
              onPressed: () {
                Navigator.pop(context);
              })),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
                color: Colors.grey[100],
                child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: MyCustomForm(
                      action2: action,
                    ))),
          ),
        ]))));
  }
}

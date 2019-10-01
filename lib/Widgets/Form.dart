import 'package:flutter/material.dart';
import '../main.dart';


 final myController = TextEditingController();


class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(action2: 1,),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  final int action2;
  MyCustomForm({@required this.action2});
  @override
  MyCustomFormState createState() {
    return MyCustomFormState(action3: action2);
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final int action3;
  MyCustomFormState({@required this.action3});
  final _formKey = GlobalKey<FormState>();
    @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: myController,
            autofocus: true,
            decoration: InputDecoration(labelText: 'Enter city id'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if(action3 == -1) 
                {
                  if(ids.contains(myController.text))
                    ids.remove(myController.text);
                  else
                  {
                     return showDialog(
                      context: context,
                      builder: (context){
                      return AlertDialog(
                        title: Text('City not in List'),);
                      });
                  }
                }
                else if(action3 == 1)
                {
                  if(ids.contains(myController.text))
                    return showDialog(
                      context: context,
                      builder: (context){
                      return AlertDialog(
                        title: Text('City already added'),);
                      });
                  else
                    ids.add(myController.text);
                }
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
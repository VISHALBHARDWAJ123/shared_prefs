import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_prefs/utils/user_simple_preferences.dart';

class SavedDetails extends StatefulWidget {
  @override
  _SavedDetailsState createState() => _SavedDetailsState();
}

class _SavedDetailsState extends State<SavedDetails> {
  var data;

  var name = UserSimplePreferences.getUsername() ?? '';

  var date = UserSimplePreferences.getBirthday() ?? '';

  var pets = UserSimplePreferences.getPets() ?? '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data =
        'Name od the user is : $name\n BirthDay of the user is : $date \n Fav. pets of the user are : $pets';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purple,
        title: Text('Saved Data'),
        centerTitle: true,
        actions: [
          Container(
            decoration: BoxDecoration(color: Colors.purple),
            // ignore: deprecated_member_use
            child: FlatButton(
                onPressed: () {
                  UserSimplePreferences.ClearData();
                  setState(() {
                    name = '';
                    date = '';
                    pets = [];
                  });
                },
                child: Icon(Icons.clear)),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              child: Text(
            data,
            textScaleFactor: 1.5,
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}

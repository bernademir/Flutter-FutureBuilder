import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:futurebuilder/postfirebase.dart';
import 'package:http/http.dart' as http;

class FirebaseView extends StatefulWidget {
  @override
  _FirebaseViewState createState() => _FirebaseViewState();
}

class _FirebaseViewState extends State<FirebaseView> {
  TextEditingController _controllerTitle;
  TextEditingController _controllerID;
  TextEditingController _controllerAuthor;

  @override
  void initState() {
    super.initState();
    _controllerTitle = new TextEditingController();
    _controllerID = new TextEditingController();
    _controllerAuthor = new TextEditingController();
  }

  Future<bool> _postFirebaseData() async {
    final _postFirebase = new PostFirebase();
    _postFirebase.title = _controllerTitle.text;
    _postFirebase.id = int.parse(_controllerID.text);
    _postFirebase.author = _controllerAuthor.text;

    final response = await http.post(
        "https://hwasampleapi.firebaseio.com/api/books.json",
        body: json.encode(_postFirebase.toJson()));

    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.body);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _controllerTitle,
                        decoration: InputDecoration(labelText: "title"),
                      ),
                      TextField(
                        controller: _controllerID,
                        decoration: InputDecoration(labelText: "id"),
                      ),
                      TextField(
                        controller: _controllerAuthor,
                        decoration: InputDecoration(labelText: "author"),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.send,
                          color: Colors.red,
                        ),
                        onPressed: () async {
                          await _postFirebaseData();
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

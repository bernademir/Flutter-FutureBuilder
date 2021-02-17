import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpFutureBuilder extends StatefulWidget {
  @override
  _HttpFutureBuilderState createState() => _HttpFutureBuilderState();
}

class _HttpFutureBuilderState extends State<HttpFutureBuilder> {
  Future getApi() async {
    return (await http
            .get("https://hwasampleapi.firebaseio.com/api/books/0/author.json"))
        .body;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData)
                return Text(json.decode(snapshot.data));
              else
                Text("You have error.Look at api.");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else
              return Text("You have error.Are you sure api ?");
            return snapshot.data;
          },
        ),
      ),
    );
  }
}

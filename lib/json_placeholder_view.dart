import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:futurebuilder/post.dart';
import 'package:http/http.dart' as http;

class JsonPlaceHolderView extends StatefulWidget {
  @override
  _JsonPlaceHolderViewState createState() => _JsonPlaceHolderViewState();
}

class _JsonPlaceHolderViewState extends State<JsonPlaceHolderView> {
  Future<Post> getJsonPlaceHolderData() async {
    final _response =
        await http.get("https://jsonplaceholder.typicode.com/posts/1");
    if (_response.statusCode == 404) {
      return null;
    }
    final _mapJson = json.decode(_response.body);
    var post = Post.fromJson(_mapJson);
    return post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Container(alignment: Alignment.center, child: _placeHolderDataWidget),
    );
  }

  Widget get _placeHolderDataWidget => FutureBuilder<Post>(
        future: getJsonPlaceHolderData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListTile(
              title: Text(snapshot.data.title),
              subtitle: Text(snapshot.data.body),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
}

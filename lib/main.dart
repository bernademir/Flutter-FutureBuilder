import 'package:flutter/material.dart';
import 'package:futurebuilder/views/file_download_view.dart';
//import 'package:futurebuilder/views/firebase_view.dart';
//import 'package:futurebuilder/httpfuture.dart';
//import 'json_placeholder_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: //HttpFutureBuilder(),
          //JsonPlaceHolderView(),
          //FirebaseView(),
          FileDownloadView(),
    );
  }
}

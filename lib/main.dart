import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:secure_file_sharing/FilePicker.dart';
import 'package:secure_file_sharing/upload.dart';
import 'SelectionPage.dart';
import 'homepage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SECURE FILE SHARING',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
       // home: MyHomePage(title: 'SECURE FILE SHARING'),
        home: homepage(),
        routes: <String, WidgetBuilder>{
           '/a': (BuildContext context) => MyHomePage(title: 'page A'),
           '/b': (BuildContext context) => SelectionPage(title: 'page B'),
          '/c': (BuildContext context) => FilePickerApp(),
        });
  }
}
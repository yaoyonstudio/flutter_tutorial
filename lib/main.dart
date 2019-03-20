import 'package:flutter/material.dart';
import 'package:flutter_tutorial/routes.dart';

import 'package:flutter_tutorial/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Tutorial',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Tutorials'),
      routes: routes,
    );
  }
}

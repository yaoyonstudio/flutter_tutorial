import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';



class FlutterWebviewBoxPage extends StatelessWidget {

  final flutterWebviewPlugin = new FlutterWebviewPlugin();


  @override
  Widget build(BuildContext context) {

//    flutterWebviewPlugin.launch(
//      'https://m.baidu.com/',
//
//      rect: new Rect.fromLTWH(
//        0.0,
//        300.0,
//        MediaQuery.of(context).size.width,
//        300.0,
//      ),
//    );



    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Webview'),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('FlutterWebviewBoxPage'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Tutorials"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/ui');
            },
            child: Container(
              constraints: BoxConstraints.expand(height: 60.0),
              margin: EdgeInsets.only(bottom: 10.0),
              alignment: Alignment(0.0, 0.0),
              color: Color(0xDDDDDDFF),
              child: Text('Flutter UI', style: TextStyle(fontSize: 28.0),),
            ),
          ),
        ]
      )
    );
  }
}

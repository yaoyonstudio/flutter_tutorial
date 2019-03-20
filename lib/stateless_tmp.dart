import 'package:flutter/material.dart';

class StatelessTemp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      // appBar: new AppBar(
        // title: new Text(widget.title),
      // ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('StatelessTemp'),
          ],
        ),
      ),
    );
  }
}

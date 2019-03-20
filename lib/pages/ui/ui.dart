import 'package:flutter/material.dart';

class UiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter UI"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(10.0),
            height: 72.0,
            child: new FlatButton(
                onPressed: () => {},
                color: Colors.lightBlueAccent,
                child: new Text('Sliders')),
          ),
          new Text('text33'),
        ],
      ),
    );
  }
}

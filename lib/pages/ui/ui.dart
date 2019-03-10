import 'package:flutter/material.dart';

class UiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter UI"),
      ),
      body: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('返回'),
              ),
            ],
          )
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Go Back',
        child: new Icon(Icons.arrow_back_ios),
      ),
    );
  }
}

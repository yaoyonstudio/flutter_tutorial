import 'package:flutter/material.dart';

class StatefulTemp extends StatefulWidget {
  StatefulTemp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StatefulTempState createState() => new _StatefulTempState();
}

class _StatefulTempState extends State<StatefulTemp> {

  @override
  void initState() {
    super.initState();
  }

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
            Text('ddd'),
          ],
        ),
      ),
    );
  }
}

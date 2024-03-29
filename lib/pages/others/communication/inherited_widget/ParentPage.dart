import 'package:flutter/material.dart';

import 'package:flutter_tutorial/pages/others/communication/inherited_widget/MyInheritedWidget.dart';

import 'package:flutter_tutorial/pages/others/communication/inherited_widget/WidgetA.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget/WidgetB.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget/WidgetC.dart';

class ParentPage extends StatefulWidget {
  ParentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ParentPageState createState() => new _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('Inherited Widget Demo'),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.blueGrey),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Parent Widget:',
                style: TextStyle(fontSize: 24.0),
              ),
              new WidgetA(),
              new Container(
                decoration: BoxDecoration(color: Colors.teal),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                child: new Column(
                  children: <Widget>[
                    new WidgetB(),
                    new WidgetC(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////



import 'package:flutter/material.dart';

import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/myitem.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/MyItemProvider.dart';

import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/WidgetA.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/WidgetB.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/WidgetC.dart';

class ParentPage2 extends StatefulWidget {
  ParentPage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ParentPage2State createState() => new _ParentPage2State();
}

class _ParentPage2State extends State<ParentPage2> {
  var myItem = MyItem([]);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyItemProvider(
      myItem: myItem,
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

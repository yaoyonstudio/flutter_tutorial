import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_tutorial/pages/others/communication/scoped_model_demo/MyItemModel.dart';

import 'package:flutter_tutorial/pages/others/communication/scoped_model_demo/WidgetA.dart';
import 'package:flutter_tutorial/pages/others/communication/scoped_model_demo/WidgetB.dart';
import 'package:flutter_tutorial/pages/others/communication/scoped_model_demo/WidgetC.dart';

class ParentPage3 extends StatefulWidget {
  ParentPage3({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ParentPage3State createState() => new _ParentPage3State();
}

class _ParentPage3State extends State<ParentPage3> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MyItemModel(),
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

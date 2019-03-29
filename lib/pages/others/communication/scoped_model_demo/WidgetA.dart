import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_tutorial/pages/others/communication/scoped_model_demo/myitem.dart';
import 'package:flutter_tutorial/pages/others/communication/scoped_model_demo/MyItemModel.dart';

class WidgetA extends StatefulWidget {
  WidgetA({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WidgetAState createState() => new _WidgetAState();
}

class _WidgetAState extends State<WidgetA> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(color: Colors.orangeAccent),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Widget A',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          new ScopedModelDescendant<MyItemModel>(
            builder: (context, _, model) => RaisedButton(
                  child: new Text('Add'),
                  onPressed: () {
                    setState(() {
                      model.addItem(
                          'item ' + (model.items.length + 1).toString());
                    });
                  },
                ),
          ),
          new ScopedModelDescendant<MyItemModel>(
            builder: (context, _, model) => RaisedButton(
                  child: new Text('Delete'),
                  onPressed: () {
                    setState(() {
                      model.deleteItem();
                    });
                  },
                ),
          ),
        ],
      ),
    );
  }
}

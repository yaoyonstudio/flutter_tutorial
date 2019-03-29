import 'package:flutter/material.dart';

import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/MyItemProvider.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/myitem.dart';

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    MyItem myItem = MyItemProvider.of(context).myItem;
    final state = MyItemProvider.of(context);

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
          new RaisedButton(
            child: new Text('Add'),
            onPressed: () {
              state.myItem.addItem('item ' + (state.myItem.items.length + 1).toString());
              print(state.myItem.items);
            },
          ),
          new RaisedButton(
            child: new Text('Delete'),
            onPressed: () {
              state.myItem.deleteItem();
            },
          )
        ],
      ),
    );
  }
}

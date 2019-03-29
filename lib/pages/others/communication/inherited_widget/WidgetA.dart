import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget/MyInheritedWidget.dart';

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);

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
              state.addItem('item ' + (state.itemsCount + 1).toString());
            },
          ),
          new RaisedButton(
            child: new Text('Delete'),
            onPressed: () {
              state.deleteItem();
            },
          )
        ],
      ),
    );
  }
}

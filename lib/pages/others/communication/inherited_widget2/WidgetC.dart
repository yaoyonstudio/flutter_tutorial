import 'package:flutter/material.dart';

import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/MyItemProvider.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/myitem.dart';

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyItem myItem = MyItemProvider.of(context).myItem;

    return Container(
      decoration: BoxDecoration(color: Colors.cyan),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Text(
            'Widget C',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          Container(
              height: 120.0,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(myItem.items.length, (index) {
                    return Text(
                      myItem.items[index],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    );
                  }),
                ),
              )),
        ],
      ),
    );
  }
}

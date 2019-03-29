import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/MyItemProvider.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/myitem.dart';


class WidgetB extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final state = MyItemProvider.of(context);
//    var myItem = context.inheritFromWidgetOfExactType(MyItem).it;
    print(state);

    return Container(
      decoration: BoxDecoration(color: Colors.yellow),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Widget B: ${state.myItem.items.length}',
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}
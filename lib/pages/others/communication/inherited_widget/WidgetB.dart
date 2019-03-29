import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget/MyInheritedWidget.dart';

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);

    return Container(
      decoration: BoxDecoration(color: Colors.yellow),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Widget B: ${state.itemsCount}',
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}
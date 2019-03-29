import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_tutorial/pages/others/communication/scoped_model_demo/MyItemModel.dart';



class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScopedModelDescendant<MyItemModel>(
      builder: (context, _, model) => Container(
        decoration: BoxDecoration(color: Colors.yellow),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Text(
          'Widget B: ${model.items.length}',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_tutorial/pages/others/communication/scoped_model_demo/MyItemModel.dart';

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MyItemModel>(
        builder: (context, _, model) => Container(
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
                          children: List.generate(model.items.length, (index) {
                            return Text(
                              model.items[index],
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
            ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/myitem.dart';

class MyItemProvider extends InheritedWidget {
  final MyItem myItem;
  final Widget child;

  MyItemProvider({this.myItem, this.child}):super(child:child);


  static MyItemProvider of(BuildContext context) => context.inheritFromWidgetOfExactType(MyItemProvider);


  @override
  bool updateShouldNotify(MyItemProvider oldWidget) {
    return true;
  }
}

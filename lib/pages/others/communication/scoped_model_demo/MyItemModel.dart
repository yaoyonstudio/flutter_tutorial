import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_tutorial/pages/others/communication/scoped_model_demo/myitem.dart';

class MyItemModel extends Model {
  MyItem myItem = new MyItem([]);

  int get itemsCount => myItem.items.length;

  List<String> get items => myItem.items;

  void addItem(item) {
    myItem.items.add(item);
    notifyListeners();
  }

  void deleteItem() {
    if (myItem.items.length > 0) {
      myItem.items.removeLast();
      notifyListeners();
    }
  }
}

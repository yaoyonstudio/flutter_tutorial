import 'package:flutter_tutorial/pages/others/communication/redux_demo/model/model.dart';

class AddItemAction {
  static String _id;
  final String title;

  AddItemAction(this.title);

  String get id => _id;
}

class RemoveItemAction {
  final TodoItem todo;

  RemoveItemAction(this.todo);
}

class RemoveItemsAction {}

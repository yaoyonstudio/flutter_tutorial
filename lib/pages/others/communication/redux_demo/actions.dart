import 'package:flutter_tutorial/pages/others/communication/redux_demo/model.dart';

class AddItemAction {
  static int _id = 0;
  final String title;


  AddItemAction(this.title){
    _id++;
  }

  int get id => _id;
}

class RemoveItemAction {
  final TodoItem todo;

  RemoveItemAction(this.todo);
}

class RemoveItemsAction {

}

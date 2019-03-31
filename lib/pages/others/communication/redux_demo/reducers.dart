import 'package:uuid/uuid.dart';

import 'package:flutter_tutorial/pages/others/communication/redux_demo/states.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/model/model.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(todos: todoReducer(state.todos, action));
}

List<TodoItem> todoReducer(List<TodoItem> state, action) {
  if (action is AddItemAction) {
    var uuid = new Uuid();
    return []
      ..addAll(state)
      ..add(TodoItem(id: uuid.v4(), title: action.title));
  }

  if (action is RemoveItemAction) {
    return List.from(state)..remove(action.todo);
  }

  if (action is RemoveItemsAction) {
    return List.unmodifiable([]);
  }

  return state;
}

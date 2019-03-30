import 'package:flutter_tutorial/pages/others/communication/redux_demo/model.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    todos: todoReducer(state.todos, action)
  );
}

List<TodoItem> todoReducer(List<TodoItem> state, action) {
  if (action is AddItemAction) {
    return []
      ..addAll(state)
      ..add(
          TodoItem(id: action.id, title: action.title));
  }

  if (action is RemoveItemAction) {
    return List.unmodifiable(List.from(state))..remove(action.todo);
  }

  if (action is RemoveItemsAction) {
    return List.unmodifiable([]);
  }

  return state;
}

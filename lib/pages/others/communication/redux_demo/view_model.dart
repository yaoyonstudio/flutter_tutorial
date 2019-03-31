import 'package:redux/redux.dart';

import 'package:flutter_tutorial/pages/others/communication/redux_demo/states.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/model/model.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/actions.dart';

class ViewModel {
  final List<TodoItem> todos;
  final Function(TodoItem) onAddTodo;
  final Function(TodoItem) onRemoveTodo;
  final Function() onRemoveTodos;

  ViewModel({
    this.todos,
    this.onAddTodo,
    this.onRemoveTodo,
    this.onRemoveTodos,
  });

  factory ViewModel.create(Store<AppState> store) {
    _onAddTodo(TodoItem todo) {
      store.dispatch(AddItemAction(todo.title));
    }

    _onRemoveTodo(TodoItem todo) {
      store.dispatch(RemoveItemAction(todo));
    }

    _onRemoveTodos() {
      store.dispatch(RemoveItemsAction());
    }

    return ViewModel(
        todos: store.state.todos,
        onAddTodo: _onAddTodo,
        onRemoveTodo: _onRemoveTodo,
        onRemoveTodos: _onRemoveTodos);
  }
}

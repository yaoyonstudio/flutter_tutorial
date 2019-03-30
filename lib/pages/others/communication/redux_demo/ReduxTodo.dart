import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_tutorial/pages/others/communication/redux_demo/model.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/actions.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/reducers.dart';

class ReduxTodo extends StatefulWidget {
  ReduxTodo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ReduxTodoState createState() => new _ReduxTodoState();
}

class _ReduxTodoState extends State<ReduxTodo> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Store<AppState> store = Store<AppState> (
      appStateReducer,
      initialState: AppState.initialState(),
    );

    return StoreProvider<AppState>(
      store: store,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('Redux Todo Demo'),
        ),
        body: StoreConnector<AppState, _ViewModel>(
          converter: (Store<AppState> store) => _ViewModel.create(store),
          builder: (BuildContext context, _ViewModel viewModel) {
            print(viewModel.todos);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Redux Todos'),
                Text('${viewModel.todos.length}'),
                RaisedButton(
                  child: Text('Add Todo'),
                  onPressed: () {
                    viewModel.onAddTodo(
                        TodoItem(id: 2, title: 'todo item 2')
                    );
                  },
                ),
                Column(
                  children: List.generate(viewModel.todos.length, (index) {
                    return ListTile(
                      title: Text(viewModel.todos[index].title),
                    );
                  }),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}


class _ViewModel {
  final List<TodoItem> todos;
  final Function(TodoItem) onAddTodo;
  final Function(TodoItem) onRemoveTodo;
  final Function() onRemoveTodos;

  _ViewModel({
    this.todos,
    this.onAddTodo,
    this.onRemoveTodo,
    this.onRemoveTodos,
  });


  factory _ViewModel.create(Store<AppState> store) {
    _onAddTodo(TodoItem todo) {
      store.dispatch(AddItemAction(todo.title));
    }

    _onRemoveTodo(TodoItem todo) {
      store.dispatch(RemoveItemAction(todo));
    }

    _onRemoveTodos() {
      store.dispatch(RemoveItemsAction());
    }

    return _ViewModel(
      todos: store.state.todos,
      onAddTodo: _onAddTodo,
      onRemoveTodo: _onRemoveTodo,
      onRemoveTodos: _onRemoveTodos
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_tutorial/pages/others/communication/redux_demo/view_model.dart';

class TodoList extends StatelessWidget {
  final ViewModel viewModel;

  TodoList({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: List.generate(viewModel.todos.length, (index) {
          return ListTile(
            title: Text(viewModel.todos[index].title),
            subtitle: Text(viewModel.todos[index].id),
            trailing: FlatButton(
              onPressed: () {
                viewModel.onRemoveTodo(viewModel.todos[index]);
              },
              child: Icon(Icons.delete),
            ),
          );
        }),
      ),
    ));
  }
}

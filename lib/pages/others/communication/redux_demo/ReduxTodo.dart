import 'package:flutter/material.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:flutter_tutorial/pages/others/communication/redux_demo/states.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/reducers.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/view_model.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/components/AddTodoBar.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/components/TodoList.dart';

class ReduxTodo extends StatefulWidget {
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

    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
    );

    return StoreProvider<AppState>(
      store: store,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text('Redux Todo Demo'),
        ),
        body: StoreConnector<AppState, ViewModel>(
            converter: (Store<AppState> store) => ViewModel.create(store),
            builder: (BuildContext context, ViewModel viewModel) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AddTodoBar(
                    viewModel: viewModel,
                  ),
                  TodoList(
                    viewModel: viewModel,
                  ),
                ],
              );
            }),
      ),
    );
  }
}

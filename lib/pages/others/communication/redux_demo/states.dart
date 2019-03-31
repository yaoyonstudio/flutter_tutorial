import 'package:flutter/foundation.dart';

import 'package:flutter_tutorial/pages/others/communication/redux_demo/model/model.dart';

class AppState {
  final List<TodoItem> todos;

  AppState({
    @required this.todos,
  });

  AppState.initialState() : todos = List.unmodifiable(<TodoItem>[]);
}

import 'package:flutter/foundation.dart';

class TodoItem {
  final int id;
  final String title;

  TodoItem({
    @required this.id,
    @required this.title,
  });

  TodoItem copyWith({int id, String title}) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}

class AppState {
  final List<TodoItem> todos;

  AppState({
    @required this.todos,
  });

  AppState.initialState() : todos = List.unmodifiable(<TodoItem>[]);
}

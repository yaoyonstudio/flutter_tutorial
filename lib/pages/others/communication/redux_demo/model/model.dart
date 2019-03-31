import 'package:flutter/foundation.dart';

class TodoItem {
  final String id;
  final String title;

  TodoItem({
    @required this.id,
    @required this.title,
  });

  TodoItem copyWith({String id, String title}) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}

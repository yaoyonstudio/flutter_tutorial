import 'dart:convert';

Todo todoFromJson(String str) {
  final jsonData = json.decode(str);
  return Todo.fromMap(jsonData);
}

String todoToJson(Todo data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Todo {
  int id;
  String title;
  String description;
  int isDone;

  Todo({
    this.id,
    this.title,
    this.description,
    this.isDone,
  });

  factory Todo.fromMap(Map<String, dynamic> json) => new Todo(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    isDone: json['isDone'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'isDone': isDone,
  };
}



import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_tutorial/model/Todo.dart';


class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;


  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }


  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'todo.db');
    return await openDatabase(
        path,
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Todo (id INTEGER PRIMARY KEY, title TEXT, description TEXT, isDone INTEGER)");
        }
    );
  }


  createTodo(Todo newTodo) async {
    final db = await database;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Todo");
    int id = table.first['id'];
    var raw = await db.rawInsert(
      "INSERT INTO Todo(id, title, description, isDone) VALUES (?, ?, ?, ?)",
      [id, newTodo.title, newTodo.description, newTodo.isDone]
    );
    return raw;
  }


  updateTodo(Todo newTodo) async {
    final db = await database;
    var res = await db.update('Todo', newTodo.toMap(), where: "id = ?", whereArgs: [newTodo.id]);
    return res;
  }


  getTodo(int id) async {
    final db = await database;
    var res = await db.query('Todo', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Todo.fromMap(res.first) : null;
  }


  Future<List<Todo>> getTodos([int isDone, String title = '']) async {
    final db = await database;
    List<Map<String, dynamic>> res;
    if (isDone == 1 || isDone == 0) {
      if (title != '' && title != null) {
        var sql = 'SELECT * FROM Todo WHERE title LIKE "%' + title + '%" AND isDone = "1"';
        res =
        await db.rawQuery(sql);
      } else {
        res = await db.query('Todo', where: 'isDone = ?', whereArgs: [isDone]);
      }
    } else {
      if (title != '' && title != null) {
        res =
        await db.rawQuery('SELECT * FROM Todo WHERE title LIKE "%' + title + '%"');
      } else {
        res = await db.query('Todo');
      }
    }
    List<Todo> list = res.isNotEmpty ? res.map((c) => Todo.fromMap(c)).toList() : [];
    return list;
  }


  deleteTodo(int id) async {
    final db = await database;
    return db.delete('Todo', where: 'id = ?', whereArgs: [id]);
  }

  toggleDone(Todo todo) async {
    final db = await database;

    Todo isDone = Todo(
      id: todo.id,
      title: todo.title,
      description: todo.description,
      isDone: todo.isDone == 1 ? 0 : 1
    );

    var res = await db.update('Todo', isDone.toMap(), where: 'id = ?', whereArgs: [todo.id]);
    return res;
  }


}


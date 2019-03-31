import 'package:flutter/material.dart';

import 'package:flutter_tutorial/model/Todo.dart';
import 'package:flutter_tutorial/data/Database.dart';

import 'package:flutter_tutorial/components/swipe_widget.dart';

class Todos extends StatefulWidget {
  @override
  _TodosState createState() => new _TodosState();
}

class _TodosState extends State<Todos> {
  Future<List<Todo>> todos;

  int id;
  String title = '';
  String description = '';
  int isDone;
  bool showAll = true;
  String keyword;

  TextEditingController _titleController;
  TextEditingController _descriptionController;

  // 测试数据
  List<Todo> testTodos = [
    Todo(id: 1, title: 'todo1', description: 'todo111', isDone: 0),
    Todo(id: 2, title: 'todo2', description: 'todo222', isDone: 1),
    Todo(id: 3, title: 'todo3', description: 'todo333', isDone: 0),
  ];

  
  _createTodoDialog(BuildContext context) {
    return SimpleDialog(
      title: Text(
        'Create Todo',
        textAlign: TextAlign.center,
      ),
      contentPadding:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0, bottom: 20.0),
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: 'Todo Title',
          ),
          maxLines: 1,
          controller: _titleController,
          onChanged: (text) {
            title = text;
          },
        ),
        SizedBox(
          height: 12.0,
        ),
        TextField(
          decoration: InputDecoration(hintText: 'Todo Description'),
          maxLines: 2,
          controller: _descriptionController,
          onChanged: (text) {
            description = text;
          },
        ),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          child: RaisedButton(
            onPressed: () {
              if (title == '' || description == '') {
                print('error');
                return;
              }

              if (id != null) {
                var updateTodoItem = Todo(
                    id: id, title: title, description: description, isDone: isDone);

                updateTodo(updateTodoItem).then((res) {
                  if (res != null && res > 0) {
                    setState(() {
                      todos = getTodos();
                    });
                  }
                });

              } else {
                var newTodo = Todo(
                    id: 0, title: title, description: description, isDone: 0);

                createTodo(newTodo).then((res) {
                  if (res != null && res > 0) {
                    setState(() {
                      todos = getTodos();
                    });
                  }
                });
              }


              title = '';
              description = '';
              Navigator.pop(context);
            },
            color: Colors.blue,
            textColor: Colors.white,
            padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: id == null ? Text('创建') : Text('修改'),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _titleController = new TextEditingController(text: title);
    _descriptionController = new TextEditingController(text: description);

    setState(() {
      todos = getTodos();
    });
  }

  Future<List<Todo>> getTodos([int isDone, String title]) async {
    return await DBProvider.db.getTodos(isDone, title);
  }

  Future<dynamic> createTodo(Todo todo) async {
    return await DBProvider.db.createTodo(todo);
  }


  Future<dynamic> updateTodo(Todo todo) async {
    return await DBProvider.db.updateTodo(todo);
  }


  Future<dynamic> toggle(todo, index) async {
    var res = await DBProvider.db.toggleDone(todo);

    if (res == 1) {
      todos.then((todoList) {
        setState(() {
          todoList[index].isDone = todoList[index].isDone == 1 ? 0 : 1;
        });
      });
    }
  }

  Future<dynamic> deleteTodo(int id) async {
    var res = await DBProvider.db.deleteTodo(id);
    if (res == 1) {
      setState(() {
        todos = getTodos();
      });
    }
  }

  Future<List<Todo>> filterTodo() async {
    todos.then((todoList) {
      if (showAll) {
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: Text('Todo'),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 48.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(230, 230, 230, 1.0),
//                border: Border(bottom: BorderSide(color: Colors.grey))
              ),
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'filter string',
                      ),
                      maxLines: 1,
                      onChanged: (text) {
                        setState(() {
                          keyword = text;
                          todos = getTodos(null, text);
                        });
                      },
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Switch(
                          value: showAll,
                          onChanged: (bool value) {
                            setState(() {
                              showAll = value;
                              if (showAll) {
                                setState(() {
                                  todos = getTodos(null, keyword);
                                });
                              } else {
                                setState(() {
                                  todos = getTodos(0, keyword);
                                });
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: FutureBuilder<List<Todo>>(
                  future: todos,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Todo>> snapshot) {
                    if (snapshot.hasData && snapshot.data != null && snapshot.data.length > 0) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Todo item = snapshot.data[index];
                          return Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color.fromRGBO(
                                            210, 210, 210, 1.0)))),
                            child: OnSlide(
                              items: <ActionItems>[
                                new ActionItems(
                                    icon: new IconButton(
                                      icon: new Icon(Icons.edit),
                                      onPressed: () {},
                                      color: Colors.green,
                                    ),
                                    onPress: () {
                                      print('1');
                                      setState(() {
                                        id = item.id;
                                        title = item.title;
                                        description = item.description;
                                        isDone = item.isDone;

                                        _titleController.text = item.title;
                                        _descriptionController.text = item.description;

                                        showDialog(
                                          context: context,
                                          builder: (_) => _createTodoDialog(context),
                                        ).then((v) {
//                                          title = '';
//                                          description = '';
                                        });
                                      });
                                    },
                                    backgroudColor: Colors.white),
                                new ActionItems(
                                    icon: new IconButton(
                                      icon: new Icon(Icons.delete),
                                      onPressed: () {},
                                      color: Colors.red,
                                    ),
                                    onPress: () {
                                      print('2');
                                      deleteTodo(item.id);
                                    },
                                    backgroudColor: Colors.white),
                              ],
                              child: new Container(
                                padding: const EdgeInsets.only(top: 10.0),
                                width: 200.0,
                                child: CheckboxListTile(
                                    title: Text(item.title),
                                    subtitle: Text(
                                      item.description,
                                    ),
                                    secondary: Text((index + 1).toString()),
                                    value: item.isDone == 1,
                                    onChanged: (bool value) {
                                      toggle(item, index);
                                    }),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Container(
                        child: Text('no todos'),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          id = null;
          title = '';
          description = '';
          isDone = null;

          _titleController.text = '';
          _descriptionController.text = '';

          showDialog(
            context: context,
            builder: (_) => _createTodoDialog(context),
          ).then((v) {
            title = '';
            description = '';
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_tutorial/pages/others/communication/redux_demo/model/model.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/view_model.dart';

class AddTodoBar extends StatefulWidget {
  final ViewModel viewModel;

  AddTodoBar({Key key, this.viewModel}) : super(key: key);

  @override
  _AddTodoBarState createState() => new _AddTodoBarState();
}

class _AddTodoBarState extends State<AddTodoBar> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _textController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      decoration: BoxDecoration(color: Colors.grey[200]),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration:
                  InputDecoration(hintText: 'Todo', border: InputBorder.none),
              maxLines: 1,
              controller: _textController,
            ),
          ),
          RaisedButton(
            child: Text('Add Todo'),
            onPressed: () {
              if (_textController.text != null) {
                widget.viewModel.onAddTodo(
                    TodoItem(title: _textController.text.toString()));
              }
              _textController.clear();
            },
          ),
        ],
      ),
    );
  }
}

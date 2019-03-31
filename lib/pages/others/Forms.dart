import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_tutorial/pages/others/form/FormStepper.dart';
import 'package:flutter_tutorial/pages/others/form/FormRowWidget.dart';

class Forms extends StatefulWidget {
  @override
  _FormsState createState() => new _FormsState();
}

class _FormsState extends State<Forms> {
  String _username, _email, _password, _education, _nickname, _days;
  DateTime selectedDate = DateTime.now();
  int number = 1;

  static List<String> _educationOptions = ['高中以下', '大专', '本科', '硕士', '博士'];
  List<Widget> _educationItems =
      List.generate(_educationOptions.length, (index) {
    return Container(
      child: Center(
        child: Text(
          _educationOptions[index],
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
              fontSize: 14.0, color: Color.fromRGBO(102, 102, 102, 1.0)),
        ),
      ),
    );
  });

  // 创建一个Scaffold Global key，用于表单提交成功后在指定的Scaffold作提示
  final mainKey = GlobalKey<ScaffoldState>();

  // 创建表单Global key
  final formKey = GlobalKey<FormState>();

  // 日期选择组件
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        locale: Locale('zh', 'CH'),
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  // 自定义滚动选择组件
  _scrollSelectWidget(
      {BuildContext context,
      List<Widget> items,
      Function callback,
      String title}) {
    int _currentIndex;
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: 300.0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7.0),
                    topRight: Radius.circular(7.0))),
            child: Column(
              children: <Widget>[
                Container(
                  height: 50.0,
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            '取消',
                            style: TextStyle(fontSize: 15.0),
                          ),
                          textColor: Color.fromRGBO(102, 102, 102, 1.0),
                          color: Color.fromRGBO(234, 234, 234, 1.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0)),
                        ),
                      ),
                      Container(
                        width: 100.0,
                        child: FlatButton(
                          onPressed: () {
                            callback(_currentIndex);
                            Navigator.pop(context);
                          },
                          child: Text(
                            '确定',
                            style: TextStyle(fontSize: 15.0),
                          ),
                          textColor: Colors.white,
                          color: Color.fromRGBO(39, 65, 221, 1.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250.0,
                  child: CupertinoPicker(
                    magnification: 1.5,
                    backgroundColor: Colors.white,
//                    backgroundColor: Color.fromRGBO(247, 247, 247, 1.0),
                    children: items,
                    itemExtent: 36,
                    looping: true,
                    onSelectedItemChanged: (index) {
                      _currentIndex = index;
                    },
                  ),
                )
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: mainKey,
      appBar: AppBar(
        title: Text('Flutter Forms'),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: formKey, // 将表单key绑定到特定这个表单
        child: Container(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: '用户名:',
                ),
                validator: (str) => str.length <= 5 ? "用户名至少要5位" : null,
                onSaved: (str) => _username = str,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: '邮箱:',
                ),
                validator: (str) => !str.contains('@') ? "邮箱有误" : null,
                onSaved: (str) => _email = str,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: '密码:',
                ),
                obscureText: true,
                validator: (str) => str.length <= 8 ? "密码至少要8位" : null,
                onSaved: (str) => _password = str,
              ),
              FormRowWidget(
                  title: '出生日期', isRequired: true,
                  child: Container(
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: Text(
                        '${selectedDate.year}年${selectedDate.month}月${selectedDate.day}日',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  )),
              FormRowWidget(
                  title: '教育程度',
                  child: Container(
                    child: GestureDetector(
                      onTap: () => _scrollSelectWidget(
                          context: context,
                          items: _educationItems,
                          callback: (index) {
                            print('selected:${_educationOptions[index]}');
                            setState(() {
                              _education = _educationOptions[index];
                            });
                          }),
                      child: Text(
                        _education == null ? '请选择教育程度' : _education,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  )),
              FormRowWidget(title: '数量', desc: '请填写', child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FormStepper(value: number, minValue: 1, onChange: (value) {
                    print('changed: ${value}');
                    setState(() {
                      number = value;
                    });
                  },)
                ],
              )),
              FormRowWidget(title: '时长', child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100.0,
                    margin: EdgeInsets.only(right: 8.0),
                    child: TextField(
                      autocorrect: false,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 13.0),
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: '请输入时长',
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          _days = value;
                        });
                      },
                    ),
                  ),
                  Text('天'),
                ],
              ),),
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.grey[300],
                      child: Text('重置'),
                      onPressed: () {
                        // 获取到指定的表单
                        var form = formKey.currentState;

                        form.reset();
                      },
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      child: Text('提交'),
                      onPressed: () {
                        print('submit');

                        // 获取到指定的表单
                        var form = formKey.currentState;

                        // 表单验证
                        if (form.validate()) {
                          // 保存表单，即执行各个字段中的onSaved方法，将表单域值赋给变量(_username, _email, _password...)
                          form.save();

                          print(_username);
                          print(_email);
                          print(_password);
                          print(_days);

                          // 提交表单操作
                          // ...

                          var snackbar = SnackBar(
                            content: Text('提交成功了'),
                            duration: Duration(milliseconds: 5000),
                          );
                          mainKey.currentState.showSnackBar(snackbar);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

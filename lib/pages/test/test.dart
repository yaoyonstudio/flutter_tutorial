import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_tutorial/pages/test/custom_picker.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {

  var initValue = [2019, 3, 12];


  void initState() {
    super.initState();
  }

  selectedData(values) {
    print("Selected: ${values}");
    setState(() {
      initValue = values;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("测试页"),
      ),
      body: Container(
          child: new Column(
        children: <Widget>[
          new Text(
            'This is a test page',
          ),
          Text(initValue.toString()),
          RaisedButton(
            onPressed: () async {
              return showDatettimeWheelSelect(context: context, startYear: 2008, endYear: 2060, initValue: initValue, callback: selectedData);
            },
            child: Text('show'),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.update),
      ),
    );
  }
}

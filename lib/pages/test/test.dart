import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_tutorial/pages/test/datetime_cupertino_picker.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {

  var initValue = [2019, 3, 12];


//  datettimeWheelSelectWidget(
//      {@required BuildContext context,
//        @required int startYear,
//        @required int endYear,
//        List<int> initValue,
//        Function callback,
//        String title}) {
//
//
//    return showModalBottomSheet(
//        context: context,
//        builder: (BuildContext builder) {
//          return DatetimeCupertinoPicker(startYear: 2008, endYear: 2060, initValue: initValue,);
//        });
//  }


  @override
  testDate() {
    var year = 2019;
    var month = 3;
    var day = 20;
    var dateStr = '2019-04-05 12:18:00Z';

    var now = DateTime.now();
    var date = DateTime.utc(year, month, day);
    var date2 = DateTime.parse(dateStr);
  }

  void initState() {
    super.initState();
  }


  selectedData(values) {
    print("Selected: ${values}");
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
            onPressed: () {
              return showModalBottomSheet(context: context, builder: (context) {
                return DatetimeCupertinoPicker(startYear: 2008, endYear: 2060, callback: selectedData,);
              });
            } ,
            child: Text('show'),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: testDate,
        child: Icon(Icons.update),
      ),
    );
  }
}

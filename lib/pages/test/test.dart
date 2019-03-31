import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {

  List<int> yearList = generateNumList(2000, 2028);
  List<int> monthList = generateNumList(1, 12);
  List<int> hourList = generateNumList(1, 24);
  List<int> minuteList = generateNumList(0, 59);
  List<int> secondList = generateNumList(0, 59);

  // 根据 年/月 获取月份的天数
  static int getDayNumByYearMonth(int year, int month) {
    var beginningNextMonth = (month < 12)
        ? new DateTime(year, month + 1, 1)
        : new DateTime(year + 1, 1, 1);
    return beginningNextMonth.subtract(new Duration(days: 1)).day;
  }

  // 根据 数字num 生成一个1到num的数字数组
  static List<int> generateNumListByLength(int nums) {
    return new List<int>.generate(nums, (i) => i + 1);
  }

  // 根据 数字start/end 生成一个从start到end，间隔1的数组
  static List<int> generateNumList(int start, int end) {
    if (start > end) return [];
    if (start == end) return [start];
    return new List<int>.generate(end - start + 1, (i) => start + i);
  }

  static List<int> generateNumStepList(int start, int end, int step) {
    if (start > end) return [];
    if (start == end) return [start];
    return List.generate(((end - start) % step == 0) ? (end/step).toInt() : (end ~/ step).toInt() + 1, (i) => 0 + i * step);
  }


  @override
  testDate() {
    var year = 2019;
    var month = 3;
    var day = 20;
    var dateStr = '2019-04-05 12:18:00Z';

    var now = DateTime.now();
    var date = DateTime.utc(year, month, day);
    var date2 = DateTime.parse(dateStr);

//    print(getDayNumByYearMonth(year, month));
//
//    print(generateNumListByLength(30));
//    print(yearList);
//    print(monthList);
//    print(minuteList);
//    print(secondList);
//
//
//    print('now: ${now}');
//    print('date: ${date}');
//    print('date2: ${date2}');
  


      print(generateNumStepList(0, 60, 5));
      print(generateNumStepList(0, 60, 1));
  }

  void initState() {
    super.initState();
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
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: testDate,
        child: Icon(Icons.update),
      ),
    );
  }
}

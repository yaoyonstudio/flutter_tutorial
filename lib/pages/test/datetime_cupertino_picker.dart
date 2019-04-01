import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:async';

class DatetimeCupertinoPicker extends StatefulWidget {
  DatetimeCupertinoPicker(
      {Key key,
      @required this.startYear,
      @required this.endYear,
      this.initValue,
      this.callback,
      this.title,
      this.onChange})
      : super(key: key);

  final int startYear;
  final int endYear;
  final List<int> initValue;
  final String title;
  final Function callback;
  final Function onChange;

  @override
  _DatetimeCupertinoPickerState createState() =>
      new _DatetimeCupertinoPickerState();
}

class _DatetimeCupertinoPickerState extends State<DatetimeCupertinoPicker>
    with SingleTickerProviderStateMixin {
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
    return List.generate(
        ((end - start) % step == 0)
            ? (end / step).toInt()
            : (end ~/ step).toInt() + 1,
        (i) => 0 + i * step);
  }

  static var now = DateTime.now();

  List<int> yearList;
  List<int> monthList;
  List<int> dayList;

  int _currentYear = now.year;
  int _currentMonth = now.month;
  int _currentDay = now.day;

  FixedExtentScrollController _yearController;
  FixedExtentScrollController _monthController;
  FixedExtentScrollController _dayController;

  List<Widget> yearsWidget;
  List<Widget> monthWidget;
  List<Widget> daysWidget;

  @override
  void initState() {
    super.initState();

    yearList = generateNumList(widget.startYear, widget.endYear);
    monthList = generateNumList(1, 12);

    if (widget.initValue != null) {
      setState(() {
        _currentYear = widget.initValue[0];
        _currentMonth = widget.initValue[1];
        _currentDay = widget.initValue[2];

      });

    }

      dayList = generateNumList(1, getDayNumByYearMonth(_currentYear, _currentMonth));


      _yearController = FixedExtentScrollController(
          initialItem: _currentYear - widget.startYear);
      _monthController =
          FixedExtentScrollController(initialItem: _currentMonth - 1);
      _dayController =
          FixedExtentScrollController(initialItem: _currentDay - 1);
    }


  @override
  Widget build(BuildContext context) {
    yearsWidget = List.generate(yearList.length, (index) {
      return Container(
        child: Center(
          child: Text(
            "${yearList[index]}",
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
                fontSize: 14.0, color: Color.fromRGBO(102, 102, 102, 1.0)),
          ),
        ),
      );
    });

    monthWidget = List.generate(monthList.length, (index) {
      return Container(
        child: Center(
          child: Text(
            "${monthList[index]}",
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
                fontSize: 14.0, color: Color.fromRGBO(102, 102, 102, 1.0)),
          ),
        ),
      );
    });

    daysWidget = List.generate(dayList.length, (index) {
      return Container(
        child: Center(
          child: Text(
            "${dayList[index]}",
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
                fontSize: 14.0, color: Color.fromRGBO(102, 102, 102, 1.0)),
          ),
        ),
      );
    });

    return Container(
      height: 300.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7.0), topRight: Radius.circular(7.0))),
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
                      print('${_currentYear}-${_currentMonth}-${_currentDay}');
                      widget.callback([_currentYear, _currentMonth, _currentDay]);
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
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                yearsWidget != null && yearsWidget.length > 0
                    ? Flexible(
                        flex: 1,
                        child: CupertinoPicker(
                          magnification: 1.5,
                          backgroundColor: Colors.white,
//                    backgroundColor: Color.fromRGBO(247, 247, 247, 1.0),
                          children: yearsWidget,
                          scrollController: _yearController,
                          itemExtent: 36,
                          looping: true,
                          onSelectedItemChanged: (index) {
                            print('changed year: ${yearList[index]}');
                            var day = _currentDay;
                            setState(() {
                              _currentYear = yearList[index];
                              dayList = generateNumList(1, getDayNumByYearMonth(_currentYear, _currentMonth));
//                              if (day > dayList[dayList.length - 1]) {
//                                _currentDay = 1;
//                              } else {
//                                _currentDay = day;
//                              }
                            });
                          },
                        ),
                      )
                    : Container(),
                monthWidget != null && monthWidget.length > 0
                    ? Flexible(
                        flex: 1,
                        child: CupertinoPicker(
                          magnification: 1.5,
                          backgroundColor: Colors.white,
//                    backgroundColor: Color.fromRGBO(247, 247, 247, 1.0),
                          children: monthWidget,
                          scrollController: _monthController,
                          itemExtent: 36,
                          looping: true,
                          onSelectedItemChanged: (index) {
//                            print('changed month: ${monthList[index]}');
//                            var day = _currentDay;
//                            print('day:${day}');
                            setState(() {
                              _currentMonth = monthList[index];
                              dayList = generateNumList(1, getDayNumByYearMonth(_currentYear, monthList[index]));
//                              print(dayList[dayList.length - 1]);
//                              if (day > dayList[dayList.length - 1]) {
////                                print(1);
//                                _currentDay = 1;
//                              } else {
////                                print(2);
//                              }
                            });
                          },
                        ),
                      )
                    : Container(),
                daysWidget != null && daysWidget.length > 0
                    ? Flexible(
                        flex: 1,
                        child: CupertinoPicker(
                          magnification: 1.5,
                          backgroundColor: Colors.white,
//                    backgroundColor: Color.fromRGBO(247, 247, 247, 1.0),
                          children: daysWidget,
                          scrollController: _dayController,
                          itemExtent: 36,
                          looping: true,
                          onSelectedItemChanged: (index) {
                            print('changed day: ${dayList[index]}');
                            setState(() {
                              _currentDay = dayList[index];
                            });
                          },
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

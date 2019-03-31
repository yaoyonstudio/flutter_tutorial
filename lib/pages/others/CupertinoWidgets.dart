import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CupertinoWidgets extends StatefulWidget {
  CupertinoWidgets({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CupertinoWidgetsState createState() => new _CupertinoWidgetsState();
}

class _CupertinoWidgetsState extends State<CupertinoWidgets> {
  DateTime _setDate = DateTime.now();
  Duration initialtimer = new Duration();
  int selectitem = 1;

  Widget datetime() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      onDateTimeChanged: (DateTime newdate) {
        print(newdate);
      },
      use24hFormat: true,
      maximumDate: new DateTime(2020, 12, 30),
      minimumYear: 2010,
      maximumYear: 2020,
      minuteInterval: 1,
      mode: CupertinoDatePickerMode.dateAndTime,
    );
  }

  Widget time() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Cupertino Widgets'),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Cupertino Date Picker'),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext builder) {
                      return Container(
                        height:
                            MediaQuery.of(context).copyWith().size.height / 3,
                        child: datetime(),
                      );
                    });
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Cupertino Time Picker'),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext builder) {
                      return Container(
                          height:
                              MediaQuery.of(context).copyWith().size.height / 3,
                          child: time());
                    });
              },
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('Cupertino Custom Picker'),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext builder) {
                      return Scaffold(
                          appBar: AppBar(
                            title: Text(
                              "CupertinoPicker",
                              textAlign: TextAlign.justify,
                            ),
                            backgroundColor: Colors.teal,
                            actions: <Widget>[
                              IconButton(
                                icon: Icon(Icons.send),
                                onPressed: () {},
                              )
                            ],
                          ),
                          body: Container(
                            child: CupertinoPicker(
                              magnification: 1.5,
                              backgroundColor: Colors.black87,
                              children: <Widget>[
                                Text(
                                  "TextWidget",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                MaterialButton(
                                  child: Text(
                                    "Button Widget",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.redAccent,
                                ),
                                IconButton(
                                  icon: Icon(Icons.home),
                                  color: Colors.white,
                                  iconSize: 40,
                                  onPressed: () {},
                                )
                              ],
                              itemExtent: 50,
                              //height of each item
                              looping: true,
                              onSelectedItemChanged: (int index) {
                                selectitem = index;
                              },
                            ),
                          ));
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

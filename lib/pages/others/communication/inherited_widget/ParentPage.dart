import 'package:flutter/material.dart';

import 'package:flutter_tutorial/pages/others/communication/inherited_widget/inherited_widget.dart';

//////////////////////////////////////

class ParentPage extends StatefulWidget {
  ParentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ParentPageState createState() => new _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('Inherited Widget Demo'),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.blueGrey),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Parent Widget:',
                style: TextStyle(fontSize: 24.0),
              ),
              new WidgetA(),
              new Container(
                decoration: BoxDecoration(color: Colors.teal),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15.0),
                child: new Column(
                  children: <Widget>[
                    new WidgetB(),
                    new WidgetC(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////

class WidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);

    return new Container(
      decoration: BoxDecoration(color: Colors.orangeAccent),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            'Widget A',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          new RaisedButton(
            child: new Text('Add'),
            onPressed: () {
              state.addItem('item ' + (state.itemsCount + 1).toString());
            },
          ),
          new RaisedButton(
            child: new Text('Delete'),
            onPressed: () {
              state.deleteItem();
            },
          )
        ],
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);

    return Container(
      decoration: BoxDecoration(color: Colors.yellow),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Widget B: ${state.itemsCount}',
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
    );
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MyInheritedWidgetState state = MyInheritedWidget.of(context);

    return Container(
      decoration: BoxDecoration(color: Colors.cyan),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Text(
            'Widget C',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          Container(
              height: 120.0,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(state._items.length, (index) {
                    return Text(
                      state._items[index],
                      style: TextStyle(fontSize: 18.0, color: Colors.white,),
                    );
                  }),
                ),
              )),
        ],
      ),
    );
  }
}

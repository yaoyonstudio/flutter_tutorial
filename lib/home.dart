import 'package:flutter/material.dart';

import 'package:flutter_tutorial/pages/ui/ui.dart';
import 'package:flutter_tutorial/pages/test/test.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void initState() {
    super.initState();

    // 初始化Tab Controller
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TabBarView(
        children: <Widget>[new UiPage(), new TestPage()],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: Color.fromRGBO(246, 246, 246, 1.0),
        child: new TabBar(
          labelStyle: TextStyle(height: 1.0,),
          labelColor: Color.fromRGBO(255, 121, 0, 1.0),
          unselectedLabelColor: Color.fromRGBO(153, 153, 153, 1.0),
          indicatorColor: Color.fromRGBO(255, 121, 0, 1.0),
          indicatorWeight: 0.01,
          tabs: <Tab>[
            new Tab(
              child: Padding(
                padding: EdgeInsets.only(top: 4.0, bottom: 0.0,),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.widgets, size: 20.0,),
                    Text('UI', ),
                  ],
                )
              ),
            ),
            new Tab(
              child: Padding(
                padding: EdgeInsets.only(top: 4.0, bottom: 0.0,),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.toys, size: 20.0,),
                    Text('测试', ),
                  ],
                )
              ),
            ),

          ],
          controller: controller,
        ),
      ),
    );
  }
}
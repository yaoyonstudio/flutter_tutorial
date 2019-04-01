import 'package:flutter/material.dart';

import 'package:flutter_tutorial/components/common/LinkButton.dart';


class OthersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Flutter Others"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              LinkButton(title: 'Cupertino Widgets', link: '/cupertino',),
              LinkButton(title: 'Forms', link: '/forms',),
              LinkButton(title: 'Todos', link: '/todos',),
              LinkButton(title: 'Inherited Widget', link: '/inherited_widget',),
              LinkButton(title: 'Inherited Widget 2', link: '/inherited_widget2',),
              LinkButton(title: 'Scoped Model Demo', link: '/scoped_model_demo',),
              LinkButton(title: 'Redux Todo Demo', link: '/redux_todo_demo',),
              LinkButton(title: 'StreamBuilder Demo', link: '/stream_builder_demo',),
              LinkButton(title: 'StateFulBuilder Demo', link: '/stateful_builder_demo',),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_tutorial/components/common/LinkButton.dart';


class OthersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              LinkButton(title: 'Forms', link: '/forms',),
              LinkButton(title: 'Todos', link: '/todos',),
            ],
          ),
        ),
      ),
    );
  }
}

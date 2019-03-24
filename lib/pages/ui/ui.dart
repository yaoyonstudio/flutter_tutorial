import 'package:flutter/material.dart';

import 'package:flutter_tutorial/components/common/LinkButton.dart';

class UiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter UI"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              LinkButton(title: 'Slider', link: '/slider',),
              LinkButton(title: 'Photo', link: '/photo',)
            ],
          ),
        ),
      ),
    );
  }
}

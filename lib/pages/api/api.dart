import 'package:flutter/material.dart';

import 'package:flutter_tutorial/components/common/LinkButton.dart';

class ApiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              LinkButton(title: '选择图片/视频', link: '/pick_image',),
//              LinkButton(title: 'Photo', link: '/photo',)
            ],
          ),
        ),
      ),
    );
  }
}

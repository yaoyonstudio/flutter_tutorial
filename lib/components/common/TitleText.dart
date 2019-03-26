import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;

  TitleText({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(this.title, style: TextStyle(fontSize: 24.0),);
  }
}

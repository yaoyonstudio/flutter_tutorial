import 'package:flutter/material.dart';



class LinkButton extends StatelessWidget {
  final String title;
  final String link;

  LinkButton({Key key, this.title, this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(12.0),
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
        print(link);
        Navigator.pushNamed(context, link);
      },
      child: Text(title),
    );
  }
}

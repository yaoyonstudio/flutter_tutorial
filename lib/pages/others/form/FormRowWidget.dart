import 'package:flutter/material.dart';

class FormRowWidget extends StatelessWidget {
  final String title;
  final String desc;
  final bool isRequired;
  final double height;
  final Color borderColor;
  final Widget child;

  FormRowWidget({Key key, @required this.title, @required this.child, this.isRequired=false, this.desc='', this.height=54.0, this.borderColor}):super(key:key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color:
                  borderColor == null ? Colors.grey[400] : borderColor))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(title),
                      isRequired == true ? Text(' *', style: TextStyle(color: Colors.red),) : Container(),
                    ],
                  ),
                ),
              desc != '' ? Text(desc, style: TextStyle(color: Color.fromRGBO(204, 204, 204, 1.0), fontSize: 11.0),) : Container()
              ],
            ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}

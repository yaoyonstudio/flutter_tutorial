import 'package:flutter/material.dart';

import 'package:flutter_tutorial/components/common/TitleText.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListItemPage extends StatelessWidget {
  _showSnackBar(type) {
    print(type);
  }

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
              TitleText(title: '使用flutter_slidable',),
              new Slidable(
                delegate: new SlidableDrawerDelegate(),
                actionExtentRatio: 0.25,
                child: new Container(
                  color: Colors.white,
                  child: new ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.indigoAccent,
                      child: new Text('1'),
                      foregroundColor: Colors.white,
                    ),
                    title: new Text('列表标题1'),
                    subtitle: new Text('SlidableDrawerDelegate'),
                  ),
                ),
                actions: <Widget>[],
                secondaryActions: <Widget>[
                  new IconSlideAction(
                    caption: 'More',
                    color: Colors.black45,
                    icon: Icons.more_horiz,
                    onTap: () => _showSnackBar('More'),
                  ),
                  new IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () => _showSnackBar('Delete'),
                  ),
                ],
              ),
              new Slidable(
                delegate: new SlidableDrawerDelegate(),
                actionExtentRatio: 0.25,
                child: new Container(
                  color: Colors.white,
                  child: new ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.indigoAccent,
                      child: new Text('2'),
                      foregroundColor: Colors.white,
                    ),
                    title: new Text('列表标题2'),
                    subtitle: new Text('点击后不会自动关闭动作'),
                  ),
                ),
                actions: <Widget>[],
                secondaryActions: <Widget>[
                  new IconSlideAction(
                    caption: 'More',
                    color: Colors.black45,
                    icon: Icons.more_horiz,
                    closeOnTap: false,
                    onTap: () => _showSnackBar('More'),
                  ),
                  new IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    closeOnTap: false,
                    onTap: () => _showSnackBar('Delete'),
                  ),
                ],
              ),
              new Slidable(
                delegate: new SlidableDrawerDelegate(),
                actionExtentRatio: 0.25,
                child: new Container(
                  color: Colors.white,
                  child: new ListTile(
                    leading: new CircleAvatar(
                      backgroundColor: Colors.indigoAccent,
                      child: new Text('3'),
                      foregroundColor: Colors.white,
                    ),
                    title: new Text('列表标题3'),
                    subtitle: new Text('SlidableDrawerDelegate'),
                  ),
                ),
                actions: <Widget>[
                  new IconSlideAction(
                    caption: 'Archive',
                    color: Colors.blue,
                    icon: Icons.archive,
                    onTap: () => _showSnackBar('Archive'),
                  ),
                  new IconSlideAction(
                    caption: 'Share',
                    color: Colors.indigo,
                    icon: Icons.share,
                    onTap: () => _showSnackBar('Share'),
                  ),
                ],
                secondaryActions: <Widget>[
                  new IconSlideAction(
                    caption: 'More',
                    color: Colors.black45,
                    icon: Icons.more_horiz,
                    onTap: () => _showSnackBar('More'),
                  ),
                  new IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () => _showSnackBar('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

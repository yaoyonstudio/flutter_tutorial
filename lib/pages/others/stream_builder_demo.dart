import 'package:flutter/material.dart';

import 'dart:async';

List<String> CONTACTS = ['name1', 'name2', 'name3', 'name4', 'name5', 'name6'];

class ContactManager {
  Stream<List<String>> get contactList async* {
    for (var i = 0; i < CONTACTS.length; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield CONTACTS.sublist(0, i + 1);
    }
  }

  final StreamController<int> _contactCounter = StreamController<int>();

  Stream<int> get contactCounter => _contactCounter.stream;

  ContactManager() {
    contactList.listen((list) => _contactCounter.add(list.length));
  }
}

class StreamBuilderDemo extends StatefulWidget {
  @override
  _StreamBuilderDemoState createState() => new _StreamBuilderDemoState();
}

class _StreamBuilderDemoState extends State<StreamBuilderDemo> {
  ContactManager manager = ContactManager();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('StreamBuilder Demo'),
        actions: <Widget>[
          Chip(
            label: StreamBuilder(
                stream: manager.contactCounter,
                builder: (context, snapshot) {
                  return Text((snapshot.data ?? 0).toString(),
                      style: TextStyle(
                        color: Colors.white,
                      ));
                }),
          )
        ],
      ),
      body: StreamBuilder(
          stream: manager.contactList,
          builder: (context, snapshot) {
            List<String> contacts = snapshot.data;
            return (contacts != null && contacts.length > 0) ? ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(contacts[index]),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: contacts.length) : Container();
          }),
    );
  }
}

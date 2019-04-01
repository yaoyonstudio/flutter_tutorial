import 'package:flutter/material.dart';

class StatefulBuilderDemo extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('StatefulBuilder Demo'),
            ),
            body: Center(
              child: Text('$counter'),
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => setState(() => counter++)),
          ),
    );
  }
}

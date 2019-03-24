import 'package:flutter/material.dart';

import 'package:flutter_tutorial/pages/ui/ui.dart';
import 'package:flutter_tutorial/pages/test/test.dart';


import 'package:flutter_tutorial/pages/others/Forms.dart';
import 'package:flutter_tutorial/pages/others/Todos.dart';

final Map<String, WidgetBuilder> routes = {
  '/ui': (BuildContext context) => new UiPage(),
  '/forms': (BuildContext context) => new Forms(),
  '/todos': (BuildContext context) => new Todos(),
};

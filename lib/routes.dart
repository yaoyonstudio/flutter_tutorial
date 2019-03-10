import 'package:flutter/material.dart';

import 'package:flutter_tutorial/pages/home.dart';
import 'package:flutter_tutorial/pages/ui/ui.dart';
import 'package:flutter_tutorial/pages/test/test.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => new HomePage(),
  '/ui': (BuildContext context) => new UiPage(),
  '/test': (BuildContext context) => new TestPage(),
};

import 'package:flutter/material.dart';

import 'package:flutter_tutorial/pages/ui/ui.dart';
import 'package:flutter_tutorial/pages/test/test.dart';
import 'package:flutter_tutorial/pages/api/api.dart';
import 'package:flutter_tutorial/pages/api/pick_image.dart';


import 'package:flutter_tutorial/pages/others/Forms.dart';
import 'package:flutter_tutorial/pages/others/Todos.dart';

final Map<String, WidgetBuilder> routes = {
  '/ui': (BuildContext context) => new UiPage(),
  '/api': (BuildContext context) => new ApiPage(),
  '/pick_image': (BuildContext context) => new PickImagePage(),
  '/forms': (BuildContext context) => new Forms(),
  '/todos': (BuildContext context) => new Todos(),
};

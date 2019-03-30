import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:flutter_tutorial/pages/ui/ui.dart';
import 'package:flutter_tutorial/pages/ui/swiper.dart';
import 'package:flutter_tutorial/pages/ui/slidableListItem.dart';

import 'package:flutter_tutorial/pages/test/test.dart';

import 'package:flutter_tutorial/pages/api/api.dart';
import 'package:flutter_tutorial/pages/api/pick_image.dart';
import 'package:flutter_tutorial/pages/api/video_player.dart';
import 'package:flutter_tutorial/pages/api/webview.dart';
import 'package:flutter_tutorial/pages/api/webview_page_one.dart';
import 'package:flutter_tutorial/pages/api/webview_page_two.dart';
import 'package:flutter_tutorial/pages/api/webview_page_three.dart';
import 'package:flutter_tutorial/pages/api/device_info.dart';
import 'package:flutter_tutorial/pages/api/url_launcher.dart';

import 'package:flutter_tutorial/pages/api/flutter_webview.dart';
import 'package:flutter_tutorial/pages/api/flutter_webview_box.dart';

import 'package:flutter_tutorial/pages/others/Forms.dart';
import 'package:flutter_tutorial/pages/others/Todos.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget/ParentPage.dart';
import 'package:flutter_tutorial/pages/others/communication/inherited_widget2/ParentPage2.dart';
import 'package:flutter_tutorial/pages/others/communication/scoped_model_demo/ParentPage3.dart';
import 'package:flutter_tutorial/pages/others/communication/redux_demo/ReduxTodo.dart';

final Map<String, WidgetBuilder> routes = {
  '/ui': (BuildContext context) => new UiPage(),
  '/swiper': (BuildContext context) => new SwiperPage(),
  '/slidable_list_item': (BuildContext context) => new SlidableListItemPage (),


  '/api': (BuildContext context) => new ApiPage(),
  '/pick_image': (BuildContext context) => new PickImagePage(),
  '/video_player': (BuildContext context) => new VideoPlayerPage(),
  '/webview': (BuildContext context) => new WebviewPage(),
  '/webview_page_one': (BuildContext context) => new WebviewPageOne(),
  '/webview_page_two': (BuildContext context) => new WebviewPageTwo(),
  '/webview_page_three': (BuildContext context) => new WebviewPageThree(),
  '/flutter_webview': (BuildContext context) => new FlutterWebviewPage(),
  "/flutter_webview_basic": (_) => new WebviewScaffold(
        url: "https://m.baidu.com/",
        appBar: new AppBar(
          title: new Text("使用导航功能全屏打开网页"),
        ),
        withZoom: true,
        withLocalStorage: true,
        hidden: true,
        initialChild: Container(
          color: Colors.redAccent,
          child: Center(
            child: Text('Loading...'),
          ),
        ),
      ),
  '/flutter_webview_box': (BuildContext context) => new FlutterWebviewBoxPage(),
  '/device_info': (BuildContext context) => new DeviceInfo(),
  '/url_launcher': (BuildContext context) => new UrlLauncher(),
  '/forms': (BuildContext context) => new Forms(),
  '/todos': (BuildContext context) => new Todos(),
  '/inherited_widget': (BuildContext context) => new ParentPage(),
  '/inherited_widget2': (BuildContext context) => new ParentPage2(),
  '/scoped_model_demo': (BuildContext context) => new ParentPage3(),
  '/redux_todo_demo': (BuildContext context) => new ReduxTodo(),
};

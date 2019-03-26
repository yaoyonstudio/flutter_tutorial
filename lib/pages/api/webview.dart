import 'package:flutter/material.dart';

import 'dart:async';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_tutorial/components/common/LinkButton.dart';

class WebviewPage extends StatelessWidget {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('WebView'),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LinkButton(
              title: 'Webview 基本使用',
              link: '/webview_page_one',
            ),
            LinkButton(
              title: '监听返回(包括Android物理返回键)',
              link: '/webview_page_two',
            ),
            LinkButton(
              title: 'Webview与Flutter交互',
              link: '/webview_page_three',
            ),
          ],
        ),
      ),
    );
  }
}

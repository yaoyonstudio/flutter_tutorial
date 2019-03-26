import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebviewPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('WebView基本使用'),
      ),
      body: WebView(
        key: UniqueKey(),
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://xw.qq.com/',
      ),
    );
  }
}

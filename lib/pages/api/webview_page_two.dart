import 'package:flutter/material.dart';

import 'dart:async';

import 'package:webview_flutter/webview_flutter.dart';


class WebviewPageTwo extends StatelessWidget {
  WebViewController _controller;

  Future<bool> _onWillPop(BuildContext context) async {
    var pageCanGoBack = await _controller.canGoBack();

    if (pageCanGoBack) {
      _controller.goBack();
      return false;
    } else {
      return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
                  title: new Text('提示'),
                  content: new Text('这已经是一级页面了，你是想退出吗?'),
                  actions: <Widget>[
                    new FlatButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: new Text('点错了'),
                    ),
                    new FlatButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: new Text('我要退出'),
                    ),
                  ],
                ),
          ) ??
          false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('监听返回(包括Android物理返回键)'),
          ),
          body: WebView(
              key: UniqueKey(),
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://xw.qq.com/',
              onWebViewCreated: (WebViewController webViewController) {
                print('WebView创建');
                _controller = webViewController;
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              var pageCanGoBack = await _controller.canGoBack();

              if (pageCanGoBack) {
                _controller.goBack();
              } else {
                _controller.loadUrl('https://m.baidu.com/');
              }
            },
            tooltip: '去搜索',
            child: Icon(Icons.search),
          ),
        ),
        onWillPop: () => _onWillPop(context));
  }
}

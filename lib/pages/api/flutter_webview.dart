import 'package:flutter/material.dart';

import 'dart:async';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'package:flutter_tutorial/components/common/LinkButton.dart';

class FlutterWebviewPage extends StatelessWidget {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  String name = 'kenny';

  openWebviewInBox(BuildContext context) {
    flutterWebviewPlugin.launch(
      'http://zntg.tigonetwork.com/flutter.html',
      rect: new Rect.fromLTWH(
        0.0,
        300.0,
        MediaQuery.of(context).size.width,
        300.0,
      ),

    );
    
    flutterWebviewPlugin.onStateChanged.listen((state) async {
//      print(state.type);
      switch(state.type) {
        case WebViewState.startLoad:
          print('startLoad');
          return Container(
            child: Text('start loading...'),
          );
          break;
        case WebViewState.finishLoad:
          break;
        case WebViewState.shouldStart:
          break;
        default:
          break;
      }
    });


    flutterWebviewPlugin.onUrlChanged.listen((url) {
      print('Webview Url变化');
      print(url);
    });



    flutterWebviewPlugin.onDestroy.listen((_) {
      print('webview destroy');
    });



  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Webview'),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('FlutterWebviewPage'),
            LinkButton(
              title: '使用导航功能全屏打开网页',
              link: '/flutter_webview_basic',
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('打开网页'),
                  onPressed: () => openWebviewInBox(context),
                ),
                RaisedButton(
                  child: Text('关闭网页'),
                  onPressed: () {
                    flutterWebviewPlugin.close();
                  },
                ),
                RaisedButton(
                  child: Text('隐藏网页'),
                  onPressed: () {
                    flutterWebviewPlugin.hide();
                  },
                ),
                RaisedButton(
                  child: Text('显示网页'),
                  onPressed: () {
                    flutterWebviewPlugin.show();
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('刷新网页'),
                  onPressed: () {
                    flutterWebviewPlugin.reload();
                  },
                ),
                RaisedButton(
                  child: Text('重定向网页'),
                  onPressed: () {
                    flutterWebviewPlugin.reloadUrl('https://m.baidu.com');
                  },
                ),
                RaisedButton(
                  child: Text('返回'),
                  onPressed: () {
                    flutterWebviewPlugin.goBack();
                  },
                ),
                RaisedButton(
                  child: Text('前进'),
                  onPressed: () {
                    flutterWebviewPlugin.goForward();
                  },
                ),
              ],
            ),
            RaisedButton(
              child: Text('Flutter中执行Webview页面中的方法'),
              onPressed: () {
                flutterWebviewPlugin.evalJavascript('executeScriptFromFlutter("' + name + '");');
              },
            ),
            Text('Webview传值给Flutter的还没实现.......'),
          ],
        ),
      ),
    );
  }
}

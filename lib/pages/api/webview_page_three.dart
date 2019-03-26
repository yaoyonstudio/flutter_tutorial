import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebviewPageThree extends StatefulWidget {
  WebviewPageThree({Key key}) : super(key: key);

  @override
  _WebviewPageThreeState createState() => new _WebviewPageThreeState();
}

class _WebviewPageThreeState extends State<WebviewPageThree> {
  WebViewController _controller;

  var name = 'ken';
  var textFromWebview = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Webview与Flutter交互'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            height: 110.0,
            color: Colors.blue[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Name:' + name),
                RaisedButton(
                  child: Text('Flutter执行Webview中的方法，传值给Webview'),
                  onPressed: () {
                    _controller.evaluateJavascript('executeScriptFromFlutter("' + name + '");');
                  },
                ),
                Text('从Webview传过来的数据:' + textFromWebview),
              ],
            ),
          ),
          Expanded(
            child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                javascriptChannels: <JavascriptChannel>[
                  JavascriptChannel(name: 'MyFlutterWebviewChannel', onMessageReceived: (JavascriptMessage message) {
                    print('这是从Webview中传过来的数据：' + message.message);
                    setState(() {
                      textFromWebview = message.message;
                    });
                  })
                ].toSet(),
                initialUrl: 'http://zntg.tigonetwork.com/flutter.html',
                onWebViewCreated: (WebViewController webViewController) {
                  print('WebView创建');
                  _controller = webViewController;
                }),
          ),
        ],
      ),
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
    );
  }
}

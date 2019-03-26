import 'package:flutter/material.dart';

import 'package:flutter_tutorial/components/common/LinkButton.dart';

class ApiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              LinkButton(title: '选择图片/视频', link: '/pick_image',),
              LinkButton(title: '播放视频', link: '/video_player',),
              LinkButton(title: '设备信息', link: '/device_info',),
              LinkButton(title: '打开浏览器/电话/邮件/短信(UrlLauncher)', link: '/url_launcher',),
              LinkButton(title: 'Webview(使用webview_flutter)', link: '/webview',),
              LinkButton(title: 'Flutter Webview', link: '/flutter_webview',),
            ],
          ),
        ),
      ),
    );
  }
}

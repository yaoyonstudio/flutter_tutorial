import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';


class UrlLauncher extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    _launchURL() async {
      const url = 'https://xw.qq.com/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _launchEmail() async {
      const url = 'mailto:yaoyonstudio@gmail.com?subject=greate%20flutter&body=awsome%20flutter';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _launchTelephone() async {
      const url = 'tel: 10086';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    _launchMessage() async {
      const url = 'sms: 10086';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return new Scaffold(
       appBar: new AppBar(
         title: new Text('Url Launcher'),
       ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('打开外部网页'),
              onPressed: _launchURL,
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('发邮件'),
              onPressed: _launchEmail,
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('打电话'),
              onPressed: _launchTelephone,
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('发信息'),
              onPressed: _launchMessage,
            ),
          ],
        ),
      ),
    );
  }
}

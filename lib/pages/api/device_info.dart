import 'package:flutter/material.dart';

import 'package:device_info/device_info.dart';


class DeviceInfo extends StatefulWidget {

  DeviceInfo({Key key, this.title}) : super(key: key);

  String title;

  @override
  _DeviceInfoState createState() => new _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {

  AndroidDeviceInfo androidInfo;

  @override
  void initState() {
    super.initState();

    getAndroidInfo().then((info) {
      print(info.model);
      setState(() {
        androidInfo = info;
      });
    });
  }


  Future<AndroidDeviceInfo> getAndroidInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    return await deviceInfo.androidInfo;
  }

  Widget CustomText(text) {
    return Text(text, style: TextStyle(fontSize: 22.0,),);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
         title: new Text('设备信息'),
       ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: androidInfo != null ? new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomText('id:' + androidInfo.id),
            CustomText('model:' + androidInfo.model),
            CustomText('brand:' + androidInfo.brand),
            CustomText('manufacturer:' + androidInfo.manufacturer),
            CustomText('device:' + androidInfo.device),
            CustomText('androidId:' + androidInfo.androidId),
            CustomText('display:' + androidInfo.display),
            CustomText('version baseOS:' + androidInfo.version.baseOS),
            CustomText('version release:' + androidInfo.version.release),
            CustomText('bootloader:' + androidInfo.bootloader),
            CustomText('hardware:' + androidInfo.hardware),
            CustomText('host:' + androidInfo.host),
            CustomText('product:' + androidInfo.product),
            CustomText('type:' + androidInfo.type),
            CustomText('tags:' + androidInfo.tags),

          ],
        ) : Container(),
      ),
    );
  }
}

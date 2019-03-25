import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class PickImagePage extends StatefulWidget {
  @override
  _PickImagePageState createState() => _PickImagePageState();
}

class _PickImagePageState extends State<PickImagePage> {
  File _image;
  String imagePath = '';

  VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.network(
        'https://img.jkxg365.com/admin/20181009/b82f2aa8de9f91f27b579c3e087aa8a7.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  Future takePhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future selectImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      imagePath = image.path;
    });
  }

  Future selectVideo() async {
    var video = await ImagePicker.pickVideo(source: ImageSource.gallery);

    setState(() {
      _videoController = VideoPlayerController.file(video)
        ..initialize().then((_) {
          setState(() {});
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择图片'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: takePhoto,
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: Text('拍摄相片'),
            ),
            FlatButton(
              onPressed: selectImage,
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: Text('选择相片'),
            ),
            FlatButton(
              onPressed: selectVideo,
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: Text('选择视频'),
            ),
            Center(
              child: _image == null
                  ? Container()
                  : Image.file(
                      _image,
                      width: 200.0,
                      height: 200.0,
                    ),
            ),
            Center(
              child: imagePath == ''
                  ? Container()
                  : Image.asset(
                      imagePath,
                      width: 200.0,
                      height: 200.0,
                    ),
            ),
            Center(
              child: _videoController.value.initialized
                  ? AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: Container(
                        width: 200.0,
                        height: 200.0,
                        child: VideoPlayer(_videoController),
                      ),
                    )
                  : Container(
                      child: Text('没有视频'),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoController.value.isPlaying
                ? _videoController.pause()
                : _videoController.play();
          });
        },
        child: Icon(
          _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

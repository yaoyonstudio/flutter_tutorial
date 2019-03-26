import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter_tutorial/model/Swiper.dart';

class KFSwiper extends StatelessWidget {
  final List<SwiperItem> slides;
  Map configs;

  KFSwiper({Key key, this.slides, this.configs}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print(this.configs);

    return Container(
      height: 200.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            slides[index].src,
            fit: BoxFit.fill,
          );
        },
        itemCount: slides.length,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}

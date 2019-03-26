import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_tutorial/components/common/TitleText.dart';
import 'package:flutter_tutorial/model/Swiper.dart';

class SwiperPage extends StatefulWidget {
  @override
  _SwiperState createState() => new _SwiperState();
}

class _SwiperState extends State<SwiperPage> {
  List<SwiperItem> slides = [
    SwiperItem(
        id: 1,
        title: 'Swiper Item 1',
        src:
            'https://tj2img.tigonetwork.com/slide/20180902/1535880460_2658283.jpg-watermark',
        link: ''),
    SwiperItem(
        id: 2,
        title: 'Swiper Item 2',
        src:
            'https://tj2img.tigonetwork.com/slide/20180902/1535880419_6384518.jpg-watermark',
        link: ''),
    SwiperItem(
        id: 3,
        title: 'Swiper Item 3',
        src:
            'https://tj2img.tigonetwork.com/slide/20180902/1535881559_5296487.jpg-watermark',
        link: ''),
    SwiperItem(
        id: 4,
        title: 'Swiper Item 4',
        src:
            'https://tj2img.tigonetwork.com/houses/20180717/1531835892_9139709.jpg-watermark',
        link: ''),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Swiper'),
      ),
      body: new Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                TitleText(title: 'flutter swiper'),
                ConstrainedBox(
                  constraints: new BoxConstraints.loose(
                      Size(MediaQuery.of(context).size.width, 180.0)),
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        child: Image.network(
                          slides[index].src,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    index: 0,
                    autoplay: true,
                    autoplayDelay: 5000,
                    loop: true,
                    viewportFraction: 0.78,
                    scale: 0.85,
                    itemCount: slides.length,
                    pagination: new SwiperPagination(),
                    control: new SwiperControl(),
                    onIndexChanged: (index) {
                      print('swipe to ' + index.toString());
                    },
                    onTap: (index) {
                      print('clicked ' + index.toString());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Column(
              children: <Widget>[
                TitleText(title: 'carousel_slider'),
                CarouselSlider(
                  height: 180.0,
//                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  enlargeCenterPage: true,
                  onPageChanged: (index) {
                    print(index);
                  },
                  scrollDirection: Axis.horizontal,
                  items: slides.map((swiperItem) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          height: 180.0,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            child: Image.network(
                              swiperItem.src,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

SwiperItem todoFromJson(String str) {
  final jsonData = json.decode(str);
  return SwiperItem.fromMap(jsonData);
}

String todoToJson(SwiperItem data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class SwiperItem {
  int id;
  String title;
  String src;
  String link;

  SwiperItem({
    this.id,
    this.title,
    this.src,
    this.link,
  });

  factory SwiperItem.fromMap(Map<String, dynamic> json) => new SwiperItem(
    id: json['id'],
    title: json['title'],
    src: json['src'],
    link: json['link'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'src': src,
    'link': link,
  };
}



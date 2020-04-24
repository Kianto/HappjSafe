import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'entity.dart';

///
/// class News extends Entity used for NEWS Page
/// *** Will be created as a collection in DB
///

class News extends Entity {
  News({String id,
    this.title,
    this.content,
    this.time,
    this.isDanger,
  })
      : super(id: id);

  News.fromJson(Map json) {
    this.id = json['id'];
    this.title = json['title'];
    this.content = json['content'];
    this.time = (json['time'] as Timestamp).toDate();
    this.isDanger = json['isDanger'];
  }

  String title;
  String content;
  DateTime time;
  bool isDanger;

  String get postTime {
    return DateFormat.yMMMd().format(time);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['time'] = this.time;
    data['isDanger'] = this.isDanger;
    return data;
  }

}

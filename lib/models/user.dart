import 'entity.dart';
import 'news.dart';
import 'route.dart';

///
/// class User extends Entity
/// *** Will be created as a collection in DB
///

class User extends Entity {
  User({String id,
    this.phone,
    this.qrCode,
    this.name,
    this.isGood,
    this.isInspector,
    this.history,
    this.warnings
  })
      : assert(null != phone),
        super(id: id);

  User.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.phone = json['phone'];
    this.name = json['name'];
    this.qrCode = json['qrCode'];
    this.isGood = json['isGood'];
    this.isInspector = json['isInspector'];

    List<Map<String, dynamic>> hisMap = json['history'];
    this.history = hisMap.map((map) => MovementRoute.fromJson(map)).toList();

    List<Map<String, dynamic>> warnMap = json['warnings'];
    this.warnings = warnMap.map((map) => News.fromJson(map)).toList();
  }

  String phone; // +xx yyy yyy yyy
  String qrCode; // link image storage
  String name;
  bool isGood;
  bool isInspector;
  List<MovementRoute> history;
  List<News> warnings;

  String get contact {
    String res = "";
    for (int i = 3; i <= phone.length; i += 3) {
      res = res +  " " + phone.substring(i - 3, i);
    }
    return res.trim();
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phone'] = this.phone;
    data['qrCode'] = this.qrCode;
    data['name'] = this.name;
    data['isGood'] = this.isGood;
    data['isInspector'] = this.isInspector;
    data['history'] = this.history.map((route) => route.toJson()).toList();
    data['warnings'] = this.warnings.map((warn) => warn.toJson()).toList();
    return data;
  }


}

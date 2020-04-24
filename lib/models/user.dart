import 'entity.dart';

///
/// class User extends Entity
///

class User extends Entity {
  User({String id,
    this.phone,
    this.qrCode,
    this.name,
    this.isGood,
    this.isInspector
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
  }

  String phone; // +xx yyy yyy yyy
  String qrCode; // link image storage
  String name;
  bool isGood;
  bool isInspector;

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
    return data;
  }


}

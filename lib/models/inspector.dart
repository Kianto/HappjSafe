import 'package:happjsafe/models/route.dart';

import 'user.dart';

///
/// class Inspector extends Entity
///

class Inspector extends User {
  Inspector({String id,
    String phone,
    String qrCode,
    String name,
    bool isGood,
    bool isInspector,
    this.inspectingServiceId,
  })
      : assert(null != phone),
        super(id: id, phone: phone, qrCode: qrCode, name: name, isGood: isGood, isInspector: isInspector);

  Inspector.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.phone = json['phone'];
    this.name = json['name'];
    this.qrCode = json['qrCode'];
    this.isGood = json['isGood'];
    this.isInspector = json['isInspector'];
    this.warnings = json['warnings'];

    List<Map<String, dynamic>> temp = json['history'];
    this.history = temp.map((map) => MovementRoute.fromJson(map)).toList();

    this.inspectingServiceId = json['inspectingServiceId'];
  }

  String inspectingServiceId;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['inspectingServiceId'] = this.inspectingServiceId;
    return data;
  }


}

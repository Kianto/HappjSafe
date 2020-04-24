import 'package:happjsafe/models/journey.dart';

import 'news.dart';
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
    List<Journey> history,
    List<News> warnings,
    this.inspectingServiceId,
  })
      : assert(null != phone),
        super(id: id, phone: phone, qrCode: qrCode, name: name,
          isGood: isGood, isInspector: isInspector,
          history: history, warnings: warnings,
      );

  Inspector.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
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

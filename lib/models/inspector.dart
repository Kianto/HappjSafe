import 'package:happjsafe/models/journey.dart';
import 'user.dart';

///
/// class Inspector extends Entity
///

class Inspector extends User {
  Inspector({this.id, this.phone, this.qrCode, this.name, this.isGood, this.isInspector, this.route, this.warnings})
      : super(id: id, phone: phone, qrCode: qrCode, name: name,
          isGood: isGood, isInspector: isInspector,
          history: route, warnings: warnings,
        );

  String id, phone, qrCode, name;
  bool isGood, isInspector;
  List<Journey> route;
  var warnings;
  String inspectingServiceId;

  Inspector.fromJson(Map<dynamic, dynamic> json) : super.fromJson(json) {
    this.inspectingServiceId = json['inspectingServiceId'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['inspectingServiceId'] = this.inspectingServiceId;
    return data;
  }


}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'entity.dart';

///
/// class Journey extends Entity
///

class Journey extends Entity {
  Journey({String id,
    this.serviceId,
    this.fromPlace,
    this.toPlace,
    this.fromTime,
    this.toTime,
    this.isGood,
  })
      : assert(null != serviceId),
        super(id: id);

  Journey.fromJson(Map json) {
    this.id = json['id'];
    this.serviceId = json['serviceId'];
    this.fromPlace = json['fromPlace'];
    this.toPlace = json['toPlace'];
    this.fromTime = (json['fromTime'] as Timestamp).toDate();
    this.toTime = (json['toTime'] as Timestamp).toDate();
    this.isGood = json['isGood'];
  }

  String serviceId;
  String fromPlace;
  String toPlace;
  DateTime fromTime;
  DateTime toTime;
  bool isGood;

  String get departureTime {
    return DateFormat('MMM dd hh:mm').format(fromTime);
  }

  String get arrivalTime {
    return DateFormat('MMM dd hh:mm').format(toTime);
  }

  String get content {
    return 'You go from $fromPlace to $toPlace [$departureTime to $arrivalTime]';
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['serviceId'] = this.serviceId;
    data['fromPlace'] = this.fromPlace;
    data['toPlace'] = this.toPlace;
    data['fromTime'] = this.fromTime;
    data['toTime'] = this.toTime;
    data['isGood'] = this.isGood;
    return data;
  }


}

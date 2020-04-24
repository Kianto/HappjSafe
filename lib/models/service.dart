import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

import 'entity.dart';

///
/// class Service extends Entity save transport provider service info
/// *** Will be created as a collection in DB
///

class Service extends Entity {
  Service({String id,
    this.provider,
    this.qrCode,
    this.fromPlace,
    this.toPlace,
    this.fromTime,
    this.toTime,
    this.passengerIds,
  })
      : assert(null != provider),
        super(id: id);

  Service.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.provider = json['provider'];
    this.qrCode = json['qrCode'];
    this.fromPlace = json['fromPlace'];
    this.toPlace = json['toPlace'];
    this.fromTime = (json['fromTime'] as Timestamp).toDate();
    this.toTime = (json['toTime'] as Timestamp).toDate();
    this.passengerIds = (json['passengerIds'] as List).map((item) => item.toString()).toList();;
  }

  String provider;
  // more info of service ...
  String qrCode;
  String fromPlace;
  String toPlace;
  DateTime fromTime;
  DateTime toTime;
  List<String> passengerIds;

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
    data['provider'] = this.provider;
    data['qrCode'] = this.qrCode;
    data['fromPlace'] = this.fromPlace;
    data['toPlace'] = this.toPlace;
    data['fromTime'] = this.fromTime;
    data['toTime'] = this.toTime;
    data['passengerIds'] = this.passengerIds;
    return data;
  }

}

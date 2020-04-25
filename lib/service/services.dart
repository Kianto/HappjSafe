

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:happjsafe/models/journey.dart';


class UserService {
  static void update_user_history (userid, route) async {
    Firestore.instance.collection('user').document(userid).updateData({"history": FieldValue.arrayUnion([route.toJson()])}).catchError((err){
      print(err);
    });
    print('success');
  }
}

class ServiceService {
  static dynamic data;
  static Journey movermentRoute;
  static dynamic get_service_info(serviceid) async {
    var snapshot =  await Firestore.instance.collection("service").document(serviceid).get();
    return snapshot;
  }

  static void update_passenger (userid, serviceid) async => Firestore.instance.collection('service').document(serviceid).updateData({"passengerIds": FieldValue.arrayUnion([userid])}).catchError((err){
      print(err);
    }); 
}
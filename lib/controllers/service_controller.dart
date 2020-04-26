import 'package:cloud_firestore/cloud_firestore.dart';

///
///
///

abstract class ServiceController {

  static Stream<DocumentSnapshot> getUserStream(String id) {
    return Firestore.instance.collection("service").document(id).snapshots();
  }



}
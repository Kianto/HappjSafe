import 'package:cloud_firestore/cloud_firestore.dart';

///
///
///

abstract class UserController {

  static Stream<DocumentSnapshot> getUserStream(String id) {
    return Firestore.instance.collection("user").document(id).snapshots();
  }



}
import 'package:cloud_firestore/cloud_firestore.dart';


class MyUser {
  String uid;
  String email;
  String fullname;
  Timestamp accountCreated;

  MyUser({
    this.uid,
    this.email,
    this.fullname,
    this.accountCreated,
  });
}
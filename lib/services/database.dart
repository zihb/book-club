import 'package:book_club_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDatabase {
  Firestore _firestore = Firestore.instance;

  Future<String> createUser(MyUser user) async {
    String retVal = "error";
    try {
      await _firestore.collection("users").document(user.uid).setData({
        'fullname': user.fullname,
        'email':user.email,
        'accountcreated':Timestamp.now(),
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
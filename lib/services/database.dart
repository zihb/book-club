
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
  Future<MyUser> getUserInfo(String uid) async {
    MyUser retVal = MyUser();
    try {
    DocumentSnapshot _docsnapshot = await _firestore.collection("users").document(uid).get();
    retVal.fullname = _docsnapshot.data["fullname"];
    retVal.email = _docsnapshot.data["email"];
    retVal.uid = uid;
    retVal.accountCreated = _docsnapshot.data["accountCreated"];
    retVal.groupId = _docsnapshot.data['groupId'];
    } catch (e) {
      print(e);
    }
    return retVal;
  }
  Future<String> createGroup(String groupName, String userUid) async {
    String retVal = "error";
    List<String> members = List();
    try {
      members.add(userUid);
      DocumentReference _docRef = await _firestore.collection("groups").add({
        'name':groupName,
        'leader':userUid,
        'members':members,
        'groupCreate':Timestamp.now(),
      });
      await _firestore.collection("users").document(userUid).updateData({
        'groupId':_docRef.documentID,
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }
  Future<String> joinGroup(String groupId, String userUid) async {
    String retVal = "error";
    List<String> members = List();
    
    try {
      members.add(userUid);
      await _firestore.collection("groups").document(groupId).updateData({
        'members' : FieldValue.arrayUnion(members),
      });
      await _firestore.collection("users").document(userUid).updateData({
        'groupId':groupId,
      });
      retVal = "success";
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}


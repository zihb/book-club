import 'package:cloud_firestore/cloud_firestore.dart';

class MyGroup{
  String id;
  String leader;
  String name;
  List<String> members;
  Timestamp groupCreated;
  MyGroup({
    this.groupCreated,
    this.id,
    this.leader,
    this.members,
    this.name,
  });
}


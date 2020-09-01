import 'package:book_club_app/screens/home/home.dart';
import 'package:book_club_app/screens/root/root.dart';
import 'package:book_club_app/services/database.dart';
import 'package:book_club_app/states/currentUser.dart';
import 'package:book_club_app/widgets/showcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JoinGroup extends StatefulWidget {
  @override
  _JoinGroupState createState() => _JoinGroupState();
}

class _JoinGroupState extends State<JoinGroup> {
   void _joinGroup (BuildContext context,String groupId) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context,listen: false);
    String _returnString = 
              await MyDatabase().joinGroup(groupId, _currentUser.getCurrentUser.uid);
    if (_returnString == "success") {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context)=>HomeScreen(),
        ), (route) => false);
    }
  }
  TextEditingController _groupIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Padding(
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[BackButton()],
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: ShowContainer(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _groupIdController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.group),
                    hintText: "Group Id",
                  ),
                ),
                SizedBox(height:20.0),
                 RaisedButton(
                  child: Text("Join",style:TextStyle(color: Colors.white)),
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () => _joinGroup(context, _groupIdController.text),
                ),
                
              ],
            ),
          ),
        ),
      Spacer(),
      ],),
    );
  }
}
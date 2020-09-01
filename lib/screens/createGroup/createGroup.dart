import 'package:book_club_app/screens/home/home.dart';
import 'package:book_club_app/screens/root/root.dart';
import 'package:book_club_app/services/database.dart';
import 'package:book_club_app/states/currentUser.dart';
import 'package:book_club_app/widgets/showcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateGroup extends StatefulWidget {
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  void _createGroup (BuildContext context,String groupName) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context,listen: false);
    String _returnString = 
              await MyDatabase().createGroup(groupName, _currentUser.getCurrentUser.uid);
    if (_returnString == "success") {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context)=>HomeScreen(),
        ), (route) => false);
    }
  }
  TextEditingController _groupNameController = TextEditingController();
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
                  controller: _groupNameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.group),
                    hintText: "Group Name",
                  ),
                ),
                SizedBox(height:20.0),
                RaisedButton(
                  color: Colors.purple,
                  onPressed: () => _createGroup(context, _groupNameController.text),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal:100),
                    child: Text("Create",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    ),
                  ),
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
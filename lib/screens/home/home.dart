import 'package:book_club_app/screens/root/root.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/currentUser.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(child: RaisedButton(child: Text("Sign Out"),onPressed: () async{
        CurrentUser _currentUser = Provider.of<CurrentUser>(context,listen: false);
        String _retVal = await _currentUser.signOut();
        if(_retVal=="success"){
          Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(builder: (context)=> MyRoot(),
            ), 
            (route) => false); }

      },),),
    );
  }
}
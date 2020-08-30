
import 'package:book_club_app/screens/noGroup/noGroup.dart';
import 'package:book_club_app/screens/root/root.dart';
import 'package:book_club_app/widgets/showcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/currentUser.dart';


class HomeScreen extends StatelessWidget {
  void _noGroupScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=> NoGroup(),
    ),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            SizedBox(height:40,),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: ShowContainer(
                child: Column(
                  children: <Widget>[
                    Text("Harry Potter and the sorcerer's Stone",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.purple,
                    ),),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:20.0),
                      child: Row(
                        children: <Widget>[
                        Text("Due in :",style:TextStyle(color: Colors.grey,fontSize:30)),
                        Text("8 Days",style:TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.purple[900]))
                      ],),
                    ),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(32.0),
                      color: Colors.purple,
                      child: MaterialButton(        
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () {},
                        child: Text("Finished Book",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white)),
                ),
                    )],
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: ShowContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Next Book Revealed in :",style: TextStyle(color: Colors.purple,fontSize:30.0),),
                  Text("8 Days",style:TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.purple[900]))                ],
                ),
              ),
            ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text("Book History"),
                color: Theme.of(context).canvasColor,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.purple,
                width: 2,
                )
                ),
                onPressed: () => _noGroupScreen(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
                          child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(32.0),
              color: Colors.lightBlue[100],
              child: MaterialButton(        
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              onPressed: () async{
        CurrentUser _currentUser = Provider.of<CurrentUser>(context,listen: false);
        String _retVal = await _currentUser.signOut();
        if(_retVal=="success"){
          Navigator.pushAndRemoveUntil(
              context, 
              MaterialPageRoute(builder: (context)=> MyRoot(),
              ), 
              (route) => false); }

      },
                          child: Text("Signout",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.grey[900])),
              ),
          ),
            ),
          
        ],
      ),
    );
  }
}



      
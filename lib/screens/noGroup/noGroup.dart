import 'package:flutter/material.dart';

class NoGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _join(){}
    void _create(){}
    return Scaffold(
      body: Column(children: <Widget>[
          Spacer(flex: 1,),
          Padding(
            padding:EdgeInsets.all(50.0),
          child: Text('Book Club',
          style: TextStyle(fontSize: 60.0,fontWeight: FontWeight.bold)),
          ),
          Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:40.0),
            child: Text("Welcome",
            textAlign: TextAlign.center,
            style:TextStyle(
              color: Colors.purple,
              fontSize: 40.0)),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("since you are not in a book club , you can select either"
            +"join a club or create a club",
            textAlign: TextAlign.center,
            style:TextStyle(
              fontSize: 20.0,
              color:Colors.lightBlue[600], )),
          ),
          Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Join",style:TextStyle(color: Colors.white)),
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  ),
                  onPressed: () =>_join(),
                ),
                RaisedButton(
                  child: Text("Create"),
                  color: Theme.of(context).canvasColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.purple,
                  width: 2,
                  )
                  ),
                  onPressed: () =>_create(),
                ),
              ],),
          ),
        ],),
      
    );
  }
}
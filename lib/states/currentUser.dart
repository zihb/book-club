// this is authentication state

import 'package:book_club_app/models/user.dart';
import 'package:book_club_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class CurrentUser extends ChangeNotifier {
MyUser _currentUser = MyUser();

MyUser get getCurrentUser => _currentUser;



// instance of firebase auth
FirebaseAuth _auth = FirebaseAuth.instance; 

//function calld in startup
Future<String> onStartup () async{
  String retVal = "error";

  try {
    FirebaseUser _firebaseuser = await _auth.currentUser();
    _currentUser.uid = _firebaseuser.uid;
    _currentUser.email= _firebaseuser.email;
    retVal = "success";
    
  } catch (e) {
    print(e);
  }

  return retVal;
}
// function for sign out
Future<String> signOut() async{
  String retVal = "error";

  try {
    await _auth.signOut();
    _currentUser = MyUser();
    retVal = "success";
    
  } catch (e) {
    print(e);
  }

  return retVal;
}
// sign up funtion
Future<String> signUpUser (String email , String password,String fullname ) async {
  String returnValue = "error";
  MyUser _user = MyUser();

try{
  
  AuthResult _authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  _user.uid = _authResult.user.uid;
  _user.email = _authResult.user.email;
  _user.fullname = fullname;
  String _retString = await MyDatabase().createUser(_user);

  if(_retString=="success"){
    returnValue="success";
  }
}
catch(e){
  print(e);
}

  return returnValue;
}

// login function
Future<bool> loginUser (String email , String password) async {
  bool returnValue = false;
  try{
    AuthResult _authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
    if(_authResult.user!=null){
      _currentUser.uid = _authResult.user.uid;
      _currentUser.email = _authResult.user.email;
      returnValue=true;
    }
  }catch(e){print(e);
  }

  return returnValue;
}
}
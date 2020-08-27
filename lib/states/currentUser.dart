// this is authentication state

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class CurrentUser extends ChangeNotifier {

// define user id and email
String _uid ;
String _email;

// accesor for uid and email

String get getUid => _uid;
String get getEmail => _email;



// instance of firebase auth
FirebaseAuth _auth = FirebaseAuth.instance; 

//function calld in startup
Future<String> onStartup () async{
  String retVal = "error";

  try {
    FirebaseUser _firebaseuser = await _auth.currentUser();
    _uid = _firebaseuser.uid;
    _email= _firebaseuser.email;
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
    _uid = null;
    _email= null;
    retVal = "success";
    
  } catch (e) {
    print(e);
  }

  return retVal;
}
// sign up funtion
Future<bool> signUpUser (String email , String password) async {
  bool returnValue = false;

try{
  
  AuthResult _authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
  if(_authResult.user !=null){
   returnValue = true; 
  }
}
catch(e){
  print(e);
}

  return returnValue ;
}

// login function
Future<bool> loginUser (String email , String password) async {
  bool returnValue = false;
  try{
    AuthResult _authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
    if(_authResult.user!=null){
      _uid = _authResult.user.uid;
      _email = _authResult.user.email;
      returnValue=true;
    }
  }catch(e){print(e);
  }

  return returnValue;
}
}
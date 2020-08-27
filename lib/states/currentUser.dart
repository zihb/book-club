// this is authentication state

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class CurrentUser extends ChangeNotifier {

// define user id and email
String _uid ;
String _email;

String get getUid => _uid;
String get getEmail => _email;


// accesor for uid and email

// instance of firebase auth
FirebaseAuth _auth = FirebaseAuth.instance; 
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
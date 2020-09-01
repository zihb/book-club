
import 'package:book_club_app/screens/noGroup/noGroup.dart';
import 'package:book_club_app/screens/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../states/currentUser.dart';
import '../home/home.dart';
import '../login/login.dart';

enum AuthStatus {
  unknown,
  notLoggedIn,
  inGroup,
  notInGroup,
}

class MyRoot extends StatefulWidget {
  @override
  _MyRootState createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  AuthStatus _authStatus = AuthStatus.unknown;
  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    // get the state , check current user , set AuthStatus based on state*
    CurrentUser _currentUser = Provider.of<CurrentUser>(context,listen:false);
    String _returnString= await _currentUser.onStartup();
    if (_returnString=="success"){
      if (_currentUser.getCurrentUser.groupId != null) {
        setState(() {
        _authStatus = AuthStatus.inGroup;
        });
      } else {     
      setState(() {
        _authStatus = AuthStatus.notInGroup;
        });
      }
    }else{
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
        });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch(_authStatus) {
      case AuthStatus.unknown:
      retVal = SplashScreen();
      break;
      case AuthStatus.notLoggedIn:
      retVal = MyLogin();
      break;
      case AuthStatus.notInGroup:
      retVal = NoGroup();
      break;
      case AuthStatus.inGroup:
      retVal = HomeScreen();
      break;
      default:
    }    
   return retVal;
  }
}
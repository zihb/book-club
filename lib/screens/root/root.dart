
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../states/currentUser.dart';
import '../home/home.dart';
import '../login/login.dart';

enum AuthStatus {
  notLoggedIn,
  loggedIn,
}

class MyRoot extends StatefulWidget {
  @override
  _MyRootState createState() => _MyRootState();
}

class _MyRootState extends State<MyRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    // get the state , check current user , set AuthStatus based on state*
    CurrentUser _currentUser = Provider.of<CurrentUser>(context,listen:false);
    String _returnString= await _currentUser.onStartup();
    if (_returnString=="success"){
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch(_authStatus) {
      case AuthStatus.notLoggedIn:
      retVal = MyLogin();
      break;
      case AuthStatus.loggedIn:
      retVal = HomeScreen();
      break;
      default:
    }    
   return retVal;
  }
}
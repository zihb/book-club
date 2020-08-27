import 'package:book_club_app/screens/login/login.dart';
import 'package:book_club_app/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
          child: MaterialApp(
        home: MyLogin(),
      ),
    );
  }
}


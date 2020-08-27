import 'package:book_club_app/screens/home/home.dart';
import 'package:book_club_app/screens/signup/signup.dart';
import 'package:book_club_app/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/home.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context,listen: false);

    try {
      if(await _currentUser.loginUser(email, password)){
        Navigator.pushAndRemoveUntil(
            context, 
            MaterialPageRoute(builder: (context)=> HomeScreen(),
            ), 
            (route) => false); 
        
      }
     
      
    } catch (e) {
      print(e);
    }
}
  @override
  Widget build(BuildContext context) {
    final email = TextField(
      controller: _emailController,
      obscureText: false,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        prefixIcon: Icon(Icons.email),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );
    final password = TextField(
      controller: _passwordController,
      obscureText: true,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(32.0),
      color: Colors.black,
      child: MaterialButton(        
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _loginUser(_emailController.text,_passwordController.text,context);
                  },
                  child: Text("Login",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white)),
                ),      
              );
              final donthaveButton = FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MySignUp(),),);
                },
                child: Text("don't have an account ? sign up now"),
              );
              return Scaffold(
                body: Center(
                  child: Container(
                    color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                      
                        SizedBox(height: 155.0,
                        child: Text('Book Club',style: TextStyle(fontSize: 60.0,fontWeight: FontWeight.bold),
                        ),
                        ),
                        SizedBox(height: 45.0,),
                        email,
                        SizedBox(height: 25.0,),
                        password,
                        SizedBox(height: 35.0,),
                        loginButton,
                        SizedBox(height: 15.0,),
                        donthaveButton,
                        SizedBox(height: 15.0,),
                      ],
                    ),
                    ),
                  ),
                ),
              );
            }
          }
          

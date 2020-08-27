import 'package:book_club_app/screens/home/home.dart';
import 'package:book_club_app/screens/login/login.dart';
import 'package:book_club_app/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySignUp extends StatefulWidget {
  @override
  _MySignUpState createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _signUpUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context,listen: false);

    try {
      if(await _currentUser.signUpUser(email, password)){
  Navigator.of(context).push(
          MaterialPageRoute (builder: (context)=>HomeScreen(),
        ));      }
    } catch (e) {
      print(e);
    }
}
  @override
  Widget build(BuildContext context) {
    final name = TextField(
      controller: _fullNameController,
      style: TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        prefixIcon: Icon(Icons.person),
        hintText: "Full Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),

    );
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
          _signUpUser(_emailController.text,_passwordController.text,context);
                  },
                  child: Text("Sign Up",style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white)),
                ),      
              );
              final donthaveButton = FlatButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyLogin(),),);
                },
                child: Text("have already an account ? login now"),
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
                       
                        Text('Book Club',style: TextStyle(fontSize: 60.0,fontWeight: FontWeight.bold),
                        ),
                        
                        SizedBox(height: 45.0,),
                        name,
                        SizedBox(height: 25.0,),
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
          



import 'package:flutter/material.dart';
import 'package:socially/pages/login_page.dart';
import 'package:socially/pages/registration.dart';


class LoginOrSignupPage extends StatefulWidget {
  const LoginOrSignupPage({ Key? key }) : super(key: key);

  @override
  _LoginOrSignupPageState createState() => _LoginOrSignupPageState();
}

class _LoginOrSignupPageState extends State<LoginOrSignupPage> {
  bool showLoginPage = true;

  void tooglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(onTap: tooglePages);
    }
    else{
      return Registration(onTap: tooglePages);
    }
  }
}
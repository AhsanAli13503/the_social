import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socially/pages/main_pag.dart';
import '../components/login_or_signup_page.dart';

class Auth extends StatelessWidget {
  
const Auth({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(  
        body:  StreamBuilder(  
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return  MainPage();
            }
            else{
              return LoginOrSignupPage();
            }
          },
        )

    );
  }
}
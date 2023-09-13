
import 'package:socially/pages/editPage.dart';
import 'package:socially/pages/home_page.dart';
import 'package:socially/pages/login_page.dart';
import 'package:socially/pages/map_page.dart';
import 'package:socially/pages/registration.dart';
import 'package:socially/sevices/auth_gate.dart';
import '../pages/MainPage.dart';
import '../pages/chat/messages.dart';

class AppRoutes{
  static  final pages = { 

        '/' : (context) => const LoginPage(),
        '/main' : (context) => MainPage(),
        '/home' : (context) => const HomePage(),
        '/authgate' : (context) => const Auth(),
        '/map' : (context) => MyMap(),
        '/registration' : (context) => const Registration(),
        
        'edit_Profile' : (context) => const editPage(),
        '/messages' : (context) => Messages(),

  };

       static  const login = '/';
       static  const  home = '/home';
       static  const main = '/main';
       static  const editProfile = '/edit_Profile';
       static  const map = "/map";
       static  const registration = "/registration";
       static  const chat = "/chat";
       static const messages = "/messages";
       static const authGate = "/authgate";
}
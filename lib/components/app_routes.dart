
import 'package:socially/pages/chat/chat_page.dart';
import 'package:socially/pages/edit_page.dart';
import 'package:socially/pages/home_page.dart';
import 'package:socially/pages/login_page.dart';
import 'package:socially/pages/map_page.dart';
import 'package:socially/pages/registration.dart';
import 'package:socially/sevices/auth_gate.dart';
import '../pages/main_pag.dart';
import '../pages/chat/messages.dart';

class AppRoutes{
  static  final pages = { 

        '/' : (context) => LoginPage(),
        '/main' : (context) => MainPage(),
        '/home' : (context) => HomePage(),
        '/authgate' : (context) => Auth(),
        '/map' : (context) => MyMap(),
        '/registration' : (context) => Registration(),
        '/chat' : (context) => ChatPage(),
        'edit_profile' :(context) => editProfilePage(),
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
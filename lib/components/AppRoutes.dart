
import 'package:socially/pages/home_page.dart';
// ignore: unused_import
import 'package:socially/pages/login_page.dart';
import 'package:socially/pages/map_page.dart';
import 'package:socially/pages/registration.dart';
import 'package:socially/sevices/auth_gate.dart';
import '../pages/MainPage.dart';

class AppRoutes{
  static  final pages = { 

        '/main' : (context) =>const MainPage(),
        '/home' : (context) => const HomePage(),
        '/authgate' : (context) => const Auth(),
        '/map' : (context) => MyMap(),
        '/registration' : (context) => const Registration(),

  };

       static  const  home = '/home';
       static  const main = '/main';
       static  const editProfile = '/edit_Profile';
       static  const map = "/map";
       static  const registration = "/registration";
       static const authGate = "/authgate";
}
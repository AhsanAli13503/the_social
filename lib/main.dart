import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socially/components/AppRoutes.dart';
import 'package:socially/components/LoginOrSignupPage.dart';
import 'package:socially/pages/EditPage.dart';
import 'package:socially/pages/MainPage.dart';
import 'package:socially/pages/login_page.dart';
import 'package:socially/sevices/auth_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'styles/colors.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => AuthServices(
      firebaseAuth: FirebaseAuth.instance,
      fireStore: FirebaseFirestore.instance,
    ),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            scaffoldBackgroundColor: MyColors.backgroundColor,
            fontFamily: 'Urbanist',
            brightness: Brightness.dark,
          ),
          home: LoginPage(),
          //initialRoute: AppRoutes.editProfile,
          //routes: AppRoutes.pages,
        );
      },
    );
  }
}
class MyAppLoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            scaffoldBackgroundColor: MyColors.backgroundColor,
            fontFamily: 'Urbanist',
            brightness: Brightness.dark,
          ),
          home: MainPage(),
          routes: AppRoutes.pages,
        );
      },
    );
  }
}

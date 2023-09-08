import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socially/sevices/auth_services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/app_routes.dart';
import 'pages/main_pag.dart';
import 'styles/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => AuthServices(),
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
          initialRoute: AppRoutes.login,
          routes: AppRoutes.pages,
        );
      },
      child: MainPage(),
    );
  }
}

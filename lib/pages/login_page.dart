import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socially/components/app_routes.dart';
import 'package:socially/components/loginsignuptextfield.dart';
import 'package:socially/pages/MainPage.dart';
import 'package:socially/sevices/auth_services.dart';
import '../components/app_icons.dart';
import '../components/app_strings.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({Key? key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passcontroller = TextEditingController();

  void signIn() async {
    final authService = Provider.of<AuthServices>(context, listen: false);

    try {
      await authService.signWithEmailPassword(
        emailController.text,
        passcontroller.text,

      );
       // Navigate to the home page on successful sign-in.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(26, 41, 71, 255),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(children: [
                  SizedBox(
                    height: 68,
                  ),
                  Text(AppStrings.helloWelcome,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    AppStrings.logintoContinue,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LoginSignupText(
                    controller: emailController,
                    hintText: AppStrings.email,
                    secure: false,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  LoginSignupText(
                    controller: passcontroller,
                    hintText: AppStrings.password,
                    secure: true,
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          print("Forgot is clicked");
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          AppStrings.forgotpassword,
                        )),
                  ),
                  SizedBox(
                    height: 32,
                  ),

                  //Login
                  SizedBox(
                    height: 48,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).pushNamed(AppRoutes.main);
                        //   print("login");

                        signIn();
                      },
                      child: Text(AppStrings.login, style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                    ),
                  ),
                  SizedBox(height: 62),
                  TextButton(
                      onPressed: () {
                        print("other opt clicked");
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child: Text(AppStrings.orsignInWith)),
                  SizedBox(
                    height: 48,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Google is clicked");
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppIcons.ic_google,
                            height: 25,
                            width: 25,
                          ),
                          Text(AppStrings.loginWithGoogle, style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 48,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Facebook is clicked");
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppIcons.ic_fb,
                            height: 22,
                            width: 22,
                          ),
                          Text(AppStrings.loginwithFacebook, style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppStrings.donthaveAccount,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(AppRoutes.registration);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          child: Text(AppStrings.signup, style: TextStyle(color: Colors.amber))),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}

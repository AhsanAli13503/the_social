// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socially/components/loginsignuptextfield.dart';
import 'package:socially/models/UserModel.dart';
import 'package:socially/pages/MainPage.dart';
import 'package:socially/pages/registration.dart';
import '../components/AppIcons.dart';
import '../components/AppStrings.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({Key? key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Check if the user is already authenticated when the page is initialized.
    Future.microtask(() {
      checkCurrentUser();
    });
  }

  void checkCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is already authenticated, navigate to MainPage.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }
  }

  void CheckValues() {
    String email = emailController.text.trim();
    String password = passcontroller.text.trim();
    if (email == "" || password == "") {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please fill all the fields :(")));
    } else {
      signIn(email, password);
    }
  }

  void signIn(String email, String password) async {
    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }

    if (credential != null) {
      String uid = credential.user!.uid;

      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection("user").doc(uid).get();

      if (userData.exists) {
// Check if the document exists before trying to access its data
        UserModel userModel =
            UserModel.fromMap(userData.data() as Map<String, dynamic>);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      } else {
// Handle the case where the document doesn't exist
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("User data not found")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(26, 41, 71, 255),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(children: [
                  const SizedBox(
                    height: 68,
                  ),
                  const Text(AppStrings.helloWelcome,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    AppStrings.logintoContinue,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  LoginSignupText(
                    controller: emailController,
                    hintText: AppStrings.email,
                    secure: false,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  LoginSignupText(
                    controller: passcontroller,
                    hintText: AppStrings.password,
                    secure: true,
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(
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
                        CheckValues();
                      },
                      child: const Text(AppStrings.login,
                          style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                      ),
                    ),
                  ),
                  const SizedBox(height: 62),
                  TextButton(
                      onPressed: () {
                        print("other opt clicked");
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(AppStrings.orsignInWith)),
                  SizedBox(
                    height: 48,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Google is clicked");
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppIcons.ic_google,
                            height: 25,
                            width: 25,
                          ),
                          const Text(AppStrings.loginWithGoogle,
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 48,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        print("Facebook is clicked");
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppIcons.ic_fb,
                            height: 22,
                            width: 22,
                          ),
                          const Text(AppStrings.loginwithFacebook,
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
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
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registration()));
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(AppStrings.signup,
                              style: TextStyle(color: Colors.amber))),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}

// ignore_for_file: unused_local_variable


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socially/components/loginsignuptextfield.dart';
import 'package:socially/models/UserModel.dart';
import 'package:socially/pages/EditPage.dart';
import 'package:socially/pages/login_page.dart';
import 'package:socially/sevices/database.dart';
import '../components/AppStrings.dart';

class Registration extends StatefulWidget {
  final void Function()? onTap;
  const Registration({super.key, this.onTap});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

    DatabaseMethods databaseMethods = new DatabaseMethods();

  // void signUp() async {
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();
  //   String confirmPassword = confirmPasswordController.text.trim();
  //   if (emailController.text.isEmpty || passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill all the fields :(")));
  //     return;
  //   }
  //   if (passwordController.text != confirmPasswordController.text) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not match :(")));
  //     return;
  //   }

  //   final authService = Provider.of<AuthServices>(context, listen: false);
  //   try {
  //     await authService.signUpwtihEmailandPassword(
  //       emailController.text,
  //       passwordController.text,
  //     ).then((value) {
        
  //          Navigator.pushReplacement(context, MaterialPageRoute
  //          (builder: (context) => EditPage()
  //          ));
  //     });
  //   } catch (e) {
  //     // ignore: use_build_context_synchronously
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  //   }
  // }
    
    void CheckValues() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    if (emailController.text.isEmpty || passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill all the fields :(")));

    if(passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not match :(")));
    }
    
    }
    else{
      Signup(email, password);
    }
    }
    
      void  Signup (String email, String password) async {
      UserCredential? credentials;
      try{
      credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      } on FirebaseAuthException catch(e){
        if(e.code == 'weak-password'){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("The password provided is too weak.")));
        } else if (e.code == 'email-already-in-use'){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("The account already exists for that email.")));
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        
      } 
      if(credentials != null){
          String uid = credentials.user!.uid;
          UserModel newUser = new UserModel(
            uid: uid,
            email: email,
            fullName: "",
            profilePic: "",
          );
          await FirebaseFirestore.instance.collection('user').doc(uid).set(
            newUser.toMap()).then((value) {
           Navigator.push(context,
           MaterialPageRoute
           (builder: (context) => EditPage(
           )
           ));
          });
          }
      }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    const Text(AppStrings.registration,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 4),
                    const Text(AppStrings.slogan,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),

                    const SizedBox(height: 50),
                    LoginSignupText(hintText: AppStrings.email, controller: emailController, secure: false),
                    const SizedBox(
                      height: 16,
                    ),
                    LoginSignupText(hintText: AppStrings.password, controller: passwordController, secure: true),
                    const SizedBox(
                      height: 16,
                    ),
                     LoginSignupText(hintText: AppStrings.cnfrmpswd, controller: confirmPasswordController, secure: true),
                    const SizedBox(
                      height: 32,
                    ),

                    SizedBox(
                      height: 48,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                          CheckValues();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                        ),
                        child: const Text(AppStrings.signup, style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already a member?"),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                           Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                          builder:(context) => LoginPage())
                          );
                          },
                          child: const Text("Login now",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    )
                  ],
                ))),
      ),
    );

  }
    

}

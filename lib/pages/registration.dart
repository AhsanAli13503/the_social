import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socially/components/AppRoutes.dart';
import 'package:socially/components/loginsignuptextfield.dart';
import 'package:socially/sevices/auth_services.dart';
import '../components/AppStrings.dart';

class Registration extends StatefulWidget {
  final void Function()? onTap;
  const Registration({super.key, this.onTap});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Passwords do not match :(")));
      return;
    }

    final authService = Provider.of<AuthServices>(context, listen: false);
    try {
      await authService.signUpwtihEmailandPassword(
        emailController.text,
        passwordController.text,
      ).then((value) {

          // ignore: unused_local_variable
          Map<String, String> userInfoMap ={
            "name" : usernameController.text,
            "email" : emailController.text,
          };
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
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
                          print("signup");
                          signUp();
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
                            Navigator.of(context).pushNamed(AppRoutes.login);
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

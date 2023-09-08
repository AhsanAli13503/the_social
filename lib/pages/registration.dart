import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socially/sevices/auth_services.dart';
import '../components/app_strings.dart';
import '../components/app_textfield.dart';

class Registration extends StatefulWidget {
  final void Function()? onTap;
  const Registration({Key? key, this.onTap});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords do not match :(")));
      return;
    }

    final authService = Provider.of<AuthServices>(context, listen: false);
    try {
      authService.signUpwtihEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(22),
                child: Column(
                  children: [
                    SizedBox(height: 60),
                    Text(AppStrings.registration,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 4),
                    Text(AppStrings.slogan,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )),

                    SizedBox(height: 50),
                    // AppTextField(hintText: AppStrings.username, secure: false ),
                    //SizedBox(height: 16,),
                    AppTextField(
                      hintText: AppStrings.email,
                      secure: false,
                      onChangeValue: (String value) {},
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    //  AppTextField(hintText: AppStrings.phoneNumber, secure: false ),
                    // SizedBox(height: 16,),
                    AppTextField(
                      hintText: AppStrings.password,
                      secure: true,
                      onChangeValue: (String value) {},
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    AppTextField(
                      hintText: AppStrings.cnfrmpswd,
                      secure: true,
                      onChangeValue: (String value) {},
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      height: 48,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                          print("signup");
                          // Navigator.of(context).pushNamed(AppRoutes.login);

                          signUp();
                        },
                        child: Text(AppStrings.signup, style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already a member?"),
                        SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            widget.onTap?.call();
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

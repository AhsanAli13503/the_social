// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../styles/colors.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final bool secure;

  final ValueChanged<String> onChangeValue;

  const AppTextField({Key? key, required this.hintText, required this.secure, required this.onChangeValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChangeValue,
      obscureText: secure,
      // controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: hintText,
        labelStyle: TextStyle(color: MyColors.white),
        border: UnderlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        filled: true,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent), borderRadius: BorderRadius.all(Radius.circular(12))),
        fillColor: MyColors.fieldColor,
      ),
    );
  }
}

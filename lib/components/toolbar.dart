// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../styles/colors.dart';
import '../styles/text.dart';


class Toolbar extends StatelessWidget  implements PreferredSizeWidget{
  final String title;
  final List <Widget> actions;
  const Toolbar({
    Key? key,
    required this.title,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  AppBar(
      automaticallyImplyLeading: false,
        title: Text(
          title,
          style: AppText.header2,
        ),
        actions: actions,
        backgroundColor: MyColors.backgroundColor.withBlue(7),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(64);
}
 
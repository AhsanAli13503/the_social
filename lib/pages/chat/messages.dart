import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socially/components/app_icons.dart';
import 'package:socially/components/user_Avatar.dart';
import 'package:socially/pages/chat/chatbar.dart';
import 'package:socially/styles/colors.dart';

class Messages extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  Scaffold( 

      appBar: AppBar( 
        backgroundColor: MyColors.backgroundColor,
        title: Text("sada"),
        actions : [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppIcons.ic_menu,
            fit: BoxFit.contain,
            height: 20,
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: UserAvatar(),
        ),
        ),
        bottomNavigationBar: ChatBar(),
        
      );
  }

}
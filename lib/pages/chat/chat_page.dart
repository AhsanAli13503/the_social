import 'package:flutter/material.dart';
import '../../components/chat_Avatar.dart';
import '../../styles/colors.dart';

class ChatPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor: MyColors.backgroundColor.withBlue(7),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: MyColors.backgroundColor,
          centerTitle: true,
          title: Text("Chat"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
              ChatAvatar(),
            ],
          ),
        ));
  }
}
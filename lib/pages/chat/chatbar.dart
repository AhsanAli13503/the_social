import 'package:flutter/material.dart';
import 'package:socially/styles/colors.dart';

  class ChatBar extends StatelessWidget{

    @override
    Widget build(BuildContext context){
      return Container( 
       height: 50,
      margin: EdgeInsets.all(24),
      width: 17,
         child: Positioned(
            right: 0,
            left: 0,
            top: 10,
            child: Container( 
              height: 70,
              decoration: BoxDecoration(  
                color: MyColors.black,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                children: [
                  Expanded(  
                    child: TextField(
                  decoration: InputDecoration(
                   hintText: "Type your message",
                   labelStyle: TextStyle( 
                    color: MyColors.black
                   ),
                    border: UnderlineInputBorder(  
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                   filled: true,
                   focusedBorder:UnderlineInputBorder(
                    borderSide: BorderSide( 
                      color: Colors.black
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(12))
                   ),
                   fillColor: MyColors.fieldColor,
                   ), ), ),
                ],
              ),
              
            )
         ),
      );
    }

  }
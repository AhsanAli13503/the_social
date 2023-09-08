import 'package:flutter/material.dart';
import 'package:socially/components/user_Avatar.dart';
import 'package:socially/styles/text.dart';

class PostItem extends StatelessWidget {
  final String user;
  const PostItem({
    Key? key,
    required this.user,
  });

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Row(
               children: [ 
               Padding(
                 padding: const EdgeInsets.only(top: 15, left: 15),
                 child: UserAvatar(size: 45),
               ),
               SizedBox(width: 16),
               Text(user, 
               style: AppText.subtitle1,
               ),
               ],
             ),
             SizedBox(height: 10,),
            Image.asset('assets/temp/dp.jpg',
            height: 300,
            width:500,
            fit : BoxFit.fill

             ),
            
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                "You should just not give up. Try harder, Every next day is gonna be your best day. I Swear", 
              style: AppText.subtitle3
              ),
            ),
      ],
    );
  }
}

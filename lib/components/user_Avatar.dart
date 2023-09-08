// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double size;
  const UserAvatar({
    Key? key,
     this.size = 40,
  }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset('assets/temp/dp.jpeg',
                fit : BoxFit.cover,
                height: size,
                width: size,
                ),
              );
      
    }

} 

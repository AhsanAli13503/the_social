import 'package:flutter/material.dart';
import 'package:socially/components/app_routes.dart';
import '../styles/text.dart';
import 'user_Avatar.dart';

class ChatAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
           Navigator.of(context).pushNamed(AppRoutes.messages);
      },
      child: const SizedBox(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15, left: 15),
              child:  UserAvatar(size: 45),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                SizedBox(height: 15),
                Text(
                  "Username",
                  style: AppText.subtitle1,
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Hey, How u doing!",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
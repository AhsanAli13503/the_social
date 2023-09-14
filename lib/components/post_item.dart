import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino library
import 'package:socially/components/user_Avatar.dart';
import 'package:socially/styles/text.dart';

class PostItem extends StatelessWidget {
  final String user;

  const PostItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              UserAvatar(size: 60),
              SizedBox(width: 16),
              Text(
                user,
                style: AppText.subtitle1.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),
          Image.asset(
            'assets/temp/dp.jpg',
            height: 300,
            width: 500,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Text(
            "You should just not give up. Try harder, Every next day is gonna be your best day. I Swear",
            style: AppText.subtitle3,
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    // Handle favorite action
                  },
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white60,
                    size: 29,
                  ),
                ),
                SizedBox(width: 10),
                CupertinoButton(
                  onPressed: () {
                    // Handle comments action
                  },
                  padding: EdgeInsets.zero,
                  child: Icon(
                    size: 29,
                    Icons.comment,
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

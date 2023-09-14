import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Import Cuper
import 'package:socially/styles/text.dart';

class PostItem extends StatefulWidget {
  final String user;
  final String image;
  final String description;
  final String post;

  const PostItem({
    Key? key,
    required this.user,
    required this.image,
    required this.description, required this.post,
  }) : super(key: key);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool isLiked = false; // Maintain the liked state here

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
              Image.asset(
               widget.image,
                fit : BoxFit.cover,
                height: 30,
                width: 30,
                ),
              SizedBox(width: 16),
              Text(
                widget.user,
                style: AppText.subtitle1.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),
          Image.asset(
            widget.post,
            height: 300,
            width: 500,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Text(
            widget.description,
            style: AppText.subtitle3,
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    // Toggle the liked state when the button is pressed
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  padding: EdgeInsets.zero,
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.white60,
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

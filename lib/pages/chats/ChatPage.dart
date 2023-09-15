import 'package:flutter/material.dart';
import 'package:socially/pages/chats/ChattApp.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> chatData = [
    {
      "user": "Shoaib",
      "image": "assets/temp/dp.jpeg",
      "description": "This is post 1 description.",
      "likes": 150,
      "posts": "assets/temp/post2.jpg",
      "message": "Hello, how are you?"
    },
    {
      "user": "Aafiyah",
      "image": "assets/temp/dp1.png",
      "description": "This is post 2 description.",
      "likes": 15,
      "posts": "assets/temp/post1.jpg",
      "message": "Hi there!"
    },
    {
      "user": "Ariba",
      "image": "assets/temp/dp2.png",
      "description": "This is post 3 description.",
      "likes": 20,
      "posts": "assets/temp/posts4.jpg",
      "message": "What's up?"
    },
    {
      "user": "Bilal",
      "image": "assets/temp/dp3.png",
      "description": "This is post 4 description.",
      "likes": 5,
      "posts": "assets/temp/quotes2.jpg",
      "message": "Hey!"
    },
    {
      "user": "Ubaid",
      "image": "assets/temp/dp4.png",
      "description": "This is post 4 description.",
      "likes": 5,
      "posts": "assets/temp/posts5.jpg",
      "message": "Good morning!"
    },
    {
      "user": "Fayyaz",
      "image": "assets/temp/dp5.png",
      "description": "This is post 4 description.",
      "likes": 5,
      "posts": "assets/temp/posts6.jpg",
      "message": "How's it going?"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8, top: 25),
        child: Container(
          child: ListView.builder(
            itemCount: chatData.length,
            itemBuilder: (context, index) {
              final chatItem = chatData[index];
              return ChatListItem(
                user: chatItem["user"],
                message: chatItem["message"],
                image: chatItem["image"],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String user;
  final String message;
  final String image;

  ChatListItem({
    required this.user,
    required this.message,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(image),
            ),
            title: Text(user),
            subtitle: Text(message),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatApp(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

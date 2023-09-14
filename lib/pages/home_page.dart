// ignore_for_file: must_be_immutable
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:socially/components/AppStrings.dart';
import 'package:socially/components/post_item.dart';
import 'package:socially/pages/map_page.dart';
import 'package:socially/sevices/auth_services.dart';
import 'package:socially/styles/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   List<Map<String, dynamic>> posts = []; // List to store posts

  @override
  void initState() {
    super.initState();
    loadPostsData(); 
  }


  Future<void> loadPostsData() async {
    // Load the JSON data from the assets
    final String postsJson = await rootBundle.loadString('assets/posts.json');
    final List<dynamic> postsData = json.decode(postsJson);

    setState(() {
      posts = List<Map<String, dynamic>>.from(postsData);
    });
  }

  void signOut() {
    final authService = Provider.of<AuthServices>(context, listen: false);
    authService.signOut();
  }

  List<String> users = [];

  

  // mockUsersFromServer() {
  //   for (var i = 0; i < 100; i++) {
  //     users.add('User number $i');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor.withBlue(7),
      appBar: AppBar(

        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: MyColors.backgroundColor,
        title: Text(AppStrings.appName),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
           MaterialPageRoute
           (builder: (context) => MyMap(
           )
           ));
            },
            icon: Icon(Icons.location_on_outlined),
          ),
        ],
      ),
     body: ListView.builder(
        itemBuilder: (context, index) {
          final post = posts[index];

          return PostItem(
            user: post['user'] ?? '',
            image: post['image'] ?? '',
            description: post['description'] ?? '',
            post: post['posts'] ?? '',
          );
        },
        itemCount: posts.length,
      ),
    );
  }
}

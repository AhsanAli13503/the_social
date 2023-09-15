import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:socially/styles/colors.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<Map<String, dynamic>> favoritePosts = [];

  @override
  void initState() {
    super.initState();
    loadFavoritePosts();
  }

  Future<void> loadFavoritePosts() async {
    final String favoritePostsJson =
        await rootBundle.loadString('assets/posts.json');
    final List<dynamic> favoritePostsData = json.decode(favoritePostsJson);

    setState(() {
      favoritePosts = List<Map<String, dynamic>>.from(favoritePostsData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor.withBlue(7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Favorites', style: TextStyle(color: Colors.white)),
        backgroundColor: MyColors.backgroundColor,
      ),
      body: ListView.builder(
        itemCount: favoritePosts.length,
        itemBuilder: (context, index) {
          final favoritePost = favoritePosts[index];

          return FavoritePostItem(
            user: favoritePost['user'] ?? '',
            image: favoritePost['image'] ?? '',
            description: favoritePost['description'] ?? '',
          );
        },
      ),
    );
  }
}

class FavoritePostItem extends StatelessWidget {
  final String user;
  final String image;
  final String description;

  const FavoritePostItem({
    Key? key,
    required this.user,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 20,
              ),
              SizedBox(width: 16),
              Text(
                user,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

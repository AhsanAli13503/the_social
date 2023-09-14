// ProfilePage.dart

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socially/pages/EditPage.dart';
import 'package:socially/pages/login_page.dart';
import 'package:socially/pages/map_page.dart'; // Import your map page here
import 'package:socially/sevices/auth_services.dart';
import '../components/AppStrings.dart';
import '../components/user_Avatar.dart';
import '../styles/colors.dart';

enum ProfileMenu {
  settings,
  logout,
}

class ProfilePage extends StatefulWidget {
  String? name;
  String? bio;
  String? location;
  ProfilePage({super.key, this.name, this.bio, this.location});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void signOut() {
    final authService = Provider.of<AuthServices>(context, listen: false);
    authService.signOut();
    // Navigate to the login page after signing out.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void navigateToMap() {
    // Navigate to the map page when PINDI is tapped.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyMap()), // Replace with the actual MapPage.
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor.withBlue(7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.backgroundColor,
        centerTitle: true,
        title: Text(
          AppStrings.profile,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.settings:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditPage()),
                  );
                  break;
                case ProfileMenu.logout:
                  signOut();
                  break;
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Edit Profile"),
                  value: ProfileMenu.settings,
                ),
                PopupMenuItem(
                  child: Text("Logout"),
                  value: ProfileMenu.logout,
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: UserAvatar(size: 120),
          ),
          Text(
            "John Doe",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "ICAT PROJECT",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: navigateToMap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: MyColors.primary,
                ),
                Text(
                  "PINDI",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline, // Add underline to make it look clickable
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildStatColumn("Followers", "3,234"),
              buildStatColumn("Posts", "445"),
              buildStatColumn("Following", "45"),
            ],
          ),
          Divider(
            thickness: 2,
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

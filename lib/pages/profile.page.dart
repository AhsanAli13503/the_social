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
      MaterialPageRoute(
          builder: (context) => MyMap()), // Replace with the actual MapPage.
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
            child: UserAvatar(size: 110),
          ),
          Text(
            "John Doe",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "TRYING TO DO OUR LEVEL BEST",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w300,
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
                  "New York",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
         // Content below the divider
Expanded(
  child: ListView.builder(
    itemCount: 10, // You can adjust this to the number of posts you want
    itemBuilder: (context, index) {
      // Define lists of post times and contents
      final postTimes = [
        '2 hours ago',
        '3 hours ago',
        '4 hours ago',
        '5 hours ago',
        '6 hours ago',
        '7 hours ago',
        '8 hours ago',
        '9 hours ago',
        '10 hours ago',
        '11 hours ago',
      ];
      final postContents = [
        'This is the first motivational coding quote. Keep coding!',
        'This is the second inspirational coding quote for you.',
        'Coding is the key to unlocking your potential.',
        'Here\'s another coding quote to keep you inspired.',
        'Stay committed to your code, and success will follow.',
        'Coding is not just a skill; it\'s an art form.',
        'Every line of code is a step toward your goals.',
        'The best way to predict the future is to code it.',
        'Coding is the language of the future.',
        'Stay curious and keep coding!',
      ];

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 0.0, // No elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          color: Colors.white.withOpacity(0.9), // Slightly transparent background color
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      postTimes[index], // Use the corresponding post time
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    // Three dots menu (you can implement this)
                    // Here's an example of an overflow menu
                    PopupMenuButton<String>(
                      color: Colors.black87,
                      itemBuilder: (context) => [
                        PopupMenuItem<String>(
                          value: 'edit',
                          child: Text('Edit'),
                        ),
                        PopupMenuItem<String>(
                          value: 'delete',
                          child: Text('Delete'),
                        ),
                      ],
                      onSelected: (value) {
                        // Handle menu item selection here
                        if (value == 'edit') {
                          // Implement edit action
                        } else if (value == 'delete') {
                          // Implement delete action
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  postContents[index], // Use the corresponding post content
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  ),
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
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

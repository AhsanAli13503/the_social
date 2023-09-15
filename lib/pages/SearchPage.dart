import 'package:flutter/material.dart';
import 'package:socially/styles/colors.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Search',
            style: TextStyle(fontWeight: FontWeight.bold,)),
        backgroundColor:
            MyColors.backgroundColor.withBlue(5), // Dark background color
        iconTheme: IconThemeData(color: Colors.white), // Icon color
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: MyColors.backgroundColor.withBlue(7),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.transparent, // Search bar background color
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with your search results count
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle tapping on a search result.
                      // You can navigate to the user's chat screen here.
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey, // Divider color
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            // Display user's profile image if available
                            // Replace with the appropriate logic
                            backgroundColor: Colors.grey,
                          ),
                          SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'User $index', // Replace with user's name
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                'Last message...', // Replace with last message
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

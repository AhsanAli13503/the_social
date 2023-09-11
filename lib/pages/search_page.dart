
import 'package:flutter/material.dart';
import 'package:socially/components/app_icons.dart';
import 'package:socially/styles/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
   _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

    TextEditingController searchTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0), // Padding for the whole body
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 45.0, // 15 units of height
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0), // Padding for left and right
                decoration: BoxDecoration(
                  color: Colors.white, // White background color
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchTextEditingController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(  
                      gradient: LinearGradient(  
                        colors: [
                          const Color(0x36FFFFFF),
                          const Color(0xFFFFFFFF)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(AppIcons.ic_profile),
                  ),
                ],
                ),
              ),
            ],
          ),
        ),
        ),   
    );
  }
}
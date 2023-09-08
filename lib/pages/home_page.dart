// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/app_routes.dart';
import '../components/app_strings.dart';
import '../components/post_item.dart';
import '../components/toolbar.dart';
import '../sevices/auth_services.dart';
import '../styles/colors.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void signOut(){
   final authService = Provider.of<AuthServices>(context, listen: false);
   authService.signOut();
}
  List<String> users = [];

  @override
  void initState() {
    super.initState();
    mockUsersFromServer();
  }

  mockUsersFromServer() {
    for (var i = 0; i < 100; i++) {
      users.add('User number $i');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor.withBlue(7),
      appBar:Toolbar( 
        title: AppStrings.appName,
       actions: [
        IconButton(  
          onPressed: (){ 
            Navigator.of(context).pushNamed(AppRoutes.map);
          },
           icon: Icon(Icons.location_on_outlined),
        ),
        ],),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostItem(
           user: users[index],
          );
        },
        itemCount: users.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 24,
           
          );
        },
      ),
    );
  }
}

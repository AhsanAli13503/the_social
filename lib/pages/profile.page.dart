import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socially/pages/login_page.dart';
import 'package:socially/sevices/auth_services.dart';
import '../components/AppStrings.dart';
import '../components/user_Avatar.dart';
import '../styles/colors.dart';
import '../styles/text.dart';

enum ProfileMenu{
  settings, 
  logout,
}



class ProfilePage extends StatefulWidget {
const ProfilePage({ Key? key }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  
void signOut(){
   final authService = Provider.of<AuthServices>(context, listen: false);
   authService.signOut();
   // Navigate to the login page after signing out.
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()));
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: MyColors.backgroundColor.withBlue(7),
      appBar: AppBar( 
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.backgroundColor,
        centerTitle: true,
        title: Text(AppStrings.profile),
        actions: [  
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value)  {
                case ProfileMenu.settings :
                print("Edit pressed");
                 break;
                case ProfileMenu.logout:
                signOut();
                break;
              }
            },    
            itemBuilder: (context){
              return [ 
                PopupMenuItem(
                child: Text("Edit Profile"), value: ProfileMenu.settings,
                ),
                PopupMenuItem(
                child: Text("Logout"), value: ProfileMenu.logout,
                ),
                ];
    },
          ),
        ],
      ),
      body: Column(  
        children : [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: UserAvatar(size: 90),
            ),
            SizedBox(height: 10,),
            Text("ICAT PROJECT", style: AppText.header2),
            SizedBox(height: 5,),
            Center(
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on_outlined),
                  Text("PINDI", style: AppText.subtitle3),
                ],
              ),
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(  
                  children: [  
                    Text("3234",style: AppText.header2),
                    Text(AppStrings.followers),
                  ],
                ),
               
                Column(  
                  children: [ 
                    Text("445", style: AppText.header2) ,
                    Text(AppStrings.posts),
                  ]
                ),
                Column(  
                  children: [ 
                    Text("45", style: AppText.header2) ,
                    Text(AppStrings.following),
                  ]
                ),
                
              ],
            ),
            Divider(thickness: 2, 
            height: 24,),
        ],
      )  
    );
  }
}
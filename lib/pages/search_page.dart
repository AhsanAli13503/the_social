import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socially/components/app_strings.dart';
import 'package:socially/pages/chat/chat.dart';
import 'package:socially/sevices/database.dart';
import 'package:socially/styles/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({ Key? key }) : super(key: key);

  @override
   _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
    DatabaseMethods databaseMethods = new DatabaseMethods();
    TextEditingController searchTextEditingController = new TextEditingController();
    

    late QuerySnapshot searchResultSnapshot;
    bool isLoading = false;
    bool haveUserSearched = false;
    
    sendMessage(String userName){
    List<String> users = [AppStrings.myName,userName];

    String chatRoomId = getChatRoomId(AppStrings.myName,userName);

    Map<String, dynamic> chatRoom = {
      "users": users,
      "chatRoomId" : chatRoomId,
    };
    
    databaseMethods.addChatRoom(chatRoom, chatRoomId);

    Navigator.push(context, MaterialPageRoute(
      builder: (context) => Chat(
        chatRoomId: chatRoomId,
      )
    ));
    }

    initiateSearch() async {
    if(searchTextEditingController.text.isNotEmpty){
      setState(() {
        isLoading = true;
      });
      await databaseMethods.searchByName(searchTextEditingController.text)
          .then((snapshot){
        searchResultSnapshot = snapshot;
        print("$searchResultSnapshot");
        setState(() {
          isLoading = false;
          haveUserSearched = true;
        });
      });
    }
        
    Widget userTile(String userName,String userEmail){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              ),
              Text(
                userEmail,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              sendMessage(userName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24)
              ),
              child: Text("Message",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),),
            ),
          )
        ],
      ),
    );
  }
        }


    
  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          controller: searchTextEditingController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
                      
                    },
                    child: Container(
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
                      
                    ),
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
class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchTile({required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context){
    return Container( 
       child: Row(  
        children: [  
          Column(  
            children: [  
              Text(userName,),
              Text(userEmail),
            ],
          ),
          Spacer(),
          Container(  
            decoration:  BoxDecoration( 
              color: Colors.blue,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(horizontal:  16, vertical: 8),
             child : Text("Message"),
          )
        ],
       ),
    );
  }

}
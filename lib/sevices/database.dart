import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods{ 

      getUserByUsername(String username){
        

      }
      uploaduserInfo(userMap){
        FirebaseFirestore.instance.collection("user")
        .add(userMap);


      }

}
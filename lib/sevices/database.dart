import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods{ 

      getUserByUsername(String username) async {
       return FirebaseFirestore.instance.collection('user')
        .where("name", isEqualTo: username )
        .get();
      }

      uploaduserInfo(userMap){
        FirebaseFirestore.instance.collection("user")
        .add(userMap);
      }

}


import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods{ 

      getUserByUsername(String username) async {
       return FirebaseFirestore.instance.collection('user')
        .where("name", isEqualTo: username )
        .get();
      }
      Future<bool> addChatRoom(chatRoom, chatRoomId) async {
       try {
    await FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

      

      uploaduserInfo(userMap){
        FirebaseFirestore.instance.collection("user")
        .add(userMap);
      }
      searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection("users")
        .where('userName', isEqualTo: searchField)
        .get();
  }
    getChats(String chatRoomId) async{
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }
   Future<bool> addMessage(String chatRoomId, chatMessageData) async {
  try {
    await FirebaseFirestore.instance.collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData);
        return true;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

  getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

}


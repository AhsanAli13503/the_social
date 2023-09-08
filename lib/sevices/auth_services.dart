import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices extends ChangeNotifier{
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    Future<UserCredential> signinwithEmailandPassword(
      String email, String password)async {
      try{
        UserCredential userCredential = 
        await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
         );

          _firestore.collection('users').doc(userCredential.user!.uid)
          .set({
                'uid': userCredential.user!.uid,
                'email': email
               }, SetOptions(merge: true));


         return userCredential;
      }
      on FirebaseAuthException catch (e)
      {
        throw Exception(e.code);
      }    
    }

    Future<UserCredential> signUpwtihEmailandPassword(
      String email,
      password ) async{
        try {
          print("${email}");
          UserCredential userCredential =
           await _firebaseAuth.createUserWithEmailAndPassword
           (email: email,
            password: password
            );

            _firestore.collection('users').
            doc(userCredential.user!.uid).set({
              'uid': userCredential.user!.uid,
              'email': email
            });
            
            return userCredential;
        } on FirebaseAuthException catch(e){
          throw Exception(e.code);

        }

    }

    Future<void> signOut() async {
      return await FirebaseAuth.instance.signOut();
    }


}
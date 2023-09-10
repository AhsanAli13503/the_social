import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices extends ChangeNotifier {
  AuthServices({
    required this.firebaseAuth,
    required this.fireStore,
  });

  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore fireStore;

  Future<UserCredential> signWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      fireStore.collection('users').doc(userCredential.user!.uid).set({'uid': userCredential.user!.uid, 'email': email}, SetOptions(merge: true));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Future<UserCredential> signUpwtihEmailandPassword(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
  //       email: "ahsanali3174@gmail.com",
  //       password: "Test@3174",
  //     );

  //     fireStore.collection('users').doc(userCredential.user!.uid).set({
  //       'uid': userCredential.user!.uid,
  //       'email': email,
  //     });

  //     return userCredential;
  //   // ignore: unused_catch_clause
  //   } on FirebaseAuthException catch (e) {
  //     // create a logic for showing SnackBar learn
  //     print("FirebaseAuthException: ${e.code} - ${e.message}");
      
  //     throw ShowErrorMessageException(e.message);
  //   }
  // }
  Future<UserCredential> signUpwtihEmailandPassword(String email, String password) async {
  try {
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // User successfully registered.
    fireStore.collection('users').doc(userCredential.user!.uid).set({
      'uid': userCredential.user!.uid,
      'email': email,
    });

    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      // Handle the case where the email is already registered.
      throw ShowErrorMessageException("Email already registered.");
    } else {
      // Handle other FirebaseAuth exceptions.
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      throw ShowErrorMessageException("Registration failed. Please try again later.");
    }
  }
}

  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}

class ShowErrorMessageException implements Exception {
  ShowErrorMessageException(String? message);
}

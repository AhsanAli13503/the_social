import 'package:firebase_auth/firebase_auth.dart';

class MyFireBaseAuth {
  MyFireBaseAuth({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  // signInWithEmailAndPassword

  //createUserWithEmailAndPassword

  Future<UserCredential> signInWithEmailAndPassword(FirebaseEmailPasswordInput firebaseEmailPasswordInput) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: firebaseEmailPasswordInput.email,
      password: firebaseEmailPasswordInput.password,
    );

    return userCredential;
  }
}

class FirebaseEmailPasswordInput {
  FirebaseEmailPasswordInput({required this.password, required this.email});

  final String password;
  final String email;
}




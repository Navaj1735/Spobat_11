import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spobat_11/exstorage/firebase/chat/model/chat_model.dart';

class FireBaseHelper{
  final auth=FirebaseAuth.instance;


  //signin user
  Future<String?> loginUser({required String email,required String pass}) async{
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: pass,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return e.message;
    }
  }
  ///signOut
  Future<void> logout() async{
    await auth.signOut();
  }
}
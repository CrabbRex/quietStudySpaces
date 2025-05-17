import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> createUserProfile(User firebaseUser) async {
  final userDoc = FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid);
  final docSnapshot = await userDoc.get();

  if(!docSnapshot.exists) {
    //User not in database
    await userDoc.set({
      'uid' : firebaseUser.uid,
      'email' : firebaseUser.email,
      'favourites' : [],
    });
  }
}
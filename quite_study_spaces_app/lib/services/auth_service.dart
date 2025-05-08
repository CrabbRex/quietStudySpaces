import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<String?> signUp({
    //Parameters
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );

      await Future.delayed(const Duration(seconds: 1));
      
      return 'Sucess';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The Password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'An Account already exists with that email';
      } else {
        return e.message.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> logIn({
    //Parameters
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return 'Sucess';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
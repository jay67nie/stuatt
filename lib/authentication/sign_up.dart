import 'package:firebase_auth/firebase_auth.dart';

class SignUp {
  SignUp({required this.email, required this.password});

  String email;
  String password;

  Future<String?> signUp() async {
    var myAuth = FirebaseAuth.instance;
    try {
      await myAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => myAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .then((value) => myAuth.currentUser!.sendEmailVerification());
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}

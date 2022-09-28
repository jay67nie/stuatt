import 'package:firebase_auth/firebase_auth.dart';
import 'package:stuatt/user-info/register.dart';

class SignUp {
  SignUp({required this.email, required this.password});

  String email;
  String password;

  Future<String?> signUp() async {
    var myAuth = FirebaseAuth.instance;


    try {
       myAuth.createUserWithEmailAndPassword(email: email, password: password);
      print("HH");
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

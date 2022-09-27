import 'package:firebase_auth/firebase_auth.dart';

class Login{
  Login({required this.email, required this.password});

  String email;
  String password;


  Future<String?> login() async {

    var myAuth = FirebaseAuth.instance;
    try {
      await myAuth.signInWithEmailAndPassword(email: email, password: password);
      print("Success");
      return 'Success';
    }
    on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found') {
        return 'This account does not exist.';
      } else if(e.code == 'wrong-password') {
        return 'The password is incorrect';
      }
      else {
        return e.message;
      }
    }
    catch(e){
      return e.toString();
    }
  }



}
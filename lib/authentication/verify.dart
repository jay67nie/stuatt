// Integrate this with the verify page
// include bool isVerified;


//in build, add isVerified? DetailsPage()
//                          :Scaffold(...)

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class Verify{

  Future<bool> checkVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    return FirebaseAuth.instance.currentUser!.emailVerified;
  }

  void timer() {
    var timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      if(await checkVerified()){
        //isVerified = checkVerified();
        //cancel timer
      }
    });
  }





  //cancel timer at dispose() for state







}
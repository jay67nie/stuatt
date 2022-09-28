import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stuatt/QRGeneration/before_page.dart';
import 'package:stuatt/QRScan/ScanQR.dart';

import '../pages/home_page.dart';
import '../pages/auth_page.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    if(user == null){
      return const AuthPage();
    }
    else{
      if(user.email!.contains("outlook")){
        return const generatepage();

      }

      else{
        return const ScanQR();
      }

    }


  }
  //     return StreamBuilder<User?>(
  //       stream: FirebaseAuth.instance.authStateChanges(),
  //       builder: ((context, snapshot) {
  //
  //         if (snapshot.hasData) {
  //           if(snapshot.data!.email == "outlook"){
  //
  //             return const generatepage();
  //           }
  //           else{
  //             return const ScanQR();
  //           }
  //
  //         } else {
  //           return const AuthPage();
  //         }
  //
  //       }),
  //     );
  // }
}

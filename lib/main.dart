import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stuatt/firebase_options.dart';
import 'package:stuatt/authentication/next_page.dart';
import 'package:stuatt/pages/auth_page.dart';

import 'pages/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: NextPage());
  }
}


//change home back to NextPage
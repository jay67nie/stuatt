import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stuatt/firebase_options.dart';
import 'package:stuatt/authentication/next_page.dart';

import 'pages/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp();

  runApp(MyApp());


  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: NextPage());
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stuatt/firebase_options.dart';
import 'package:stuatt/authentication/next_page.dart';
import 'package:stuatt/pages/auth_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp();

  runApp(MyApp());


  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightBlue,
          fontFamily: 'Product Sans',

          textTheme: const TextTheme(
            bodyText1: TextStyle(fontFamily: 'Roboto',
            color: Colors.black
            ),
            headline1: TextStyle(color: Colors.black,
            fontSize: 30.0
            ),



          )


        ),
        home: const NextPage());
  }
}


//change home back to NextPage
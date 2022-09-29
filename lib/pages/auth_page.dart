import 'package:flutter/material.dart';
import '../pages/registerpage.dart';
import '../pages/loginpage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: showLoginPage? LoginPage(showRegisterPage: toggleScreens)
      : RegisterPage(showLoginPage: toggleScreens)

    );
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}


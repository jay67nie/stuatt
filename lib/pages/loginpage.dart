import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
<<<<<<<< HEAD:lib/pages/loginpage.dart
import '../pages/auth_page.dart';
========
import 'package:stuatt/authentication/login.dart';
import 'package:stuatt/authentication/sign_up.dart';
import 'package:stuatt/class/teaching.dart';
import 'package:stuatt/user-info/register.dart';
import 'package:stuatt/user-info/submit.dart';
import 'package:stuatt/class/attendance.dart';
import 'package:stuatt/class/lectureNumber.dart';
import 'package:stuatt/class/create.dart';

>>>>>>>> 39a6f164dbeac5092b33baa0f730455124463510:lib/authentication/loginpage.dart

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterpage;
  const LoginPage({Key? key, required this.showRegisterpage}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

Future SignIn() async {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _emailController.text.trim(),
    password: _passwordController.text.trim(),
  );
}

@override
void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/StuAtt.jpeg',
                height: 150,
                width: 150,
              ),
            ]),
            const SizedBox(
              height: 15.0,
            ),
            const Text(
              'STUATT',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Email'),
                    ),
                  ),
                )),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      controller: _passwordController,
<<<<<<<< HEAD:lib/pages/loginpage.dart
                      obscureText: false,
                      decoration: InputDecoration(
========
                      obscureText: true,
                      decoration: const InputDecoration(
>>>>>>>> 39a6f164dbeac5092b33baa0f730455124463510:lib/authentication/loginpage.dart
                          border: InputBorder.none, hintText: 'Password'),
                    ),
                  ),
                )),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
<<<<<<<< HEAD:lib/pages/loginpage.dart
              child: TextButton(
                onPressed: SignIn,
                child: Container(
                  padding: const EdgeInsets.all(13.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),
              ),
========
              child: ElevatedButton(
                onPressed: (){
                  print("HH");
                  //Login(email: 'jeromessenyonjo@outlook.com', password: 'One+2=3!').login();
                 // LectureNo(courseUnit: 'CSC1202').getLecNo();
                  //Create(courseCode: 'CSC1204', lecNo: '1');
                  //Teaching().getCourses();
                  //Attendance(course: 'CSC', lecNo: '3', cUnit: 'CSC1202').getLecNo();
                  //Submit(course: 'CSC', courseUnit: "CSC1202", lecNo: "4").submit();

                  //SignUp(email: 'jeromessenyonjo@outlook.com', password: 'One+2=3!').signUp();
                  },
                child: const Text("Sign in"),
              )
              // child: GestureDetector(
              //   onTap: (){},  //SignIn
              //   child: Container(
              //     padding: const EdgeInsets.all(13.0),
              //     decoration: BoxDecoration(
              //       color: Colors.green,
              //       border: Border.all(color: Colors.black),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     child: Center(
              //       child: Text(
              //         'Sign In',
              //         style: TextStyle(
              //             color: Colors.black,
              //             fontWeight: FontWeight.bold,
              //             fontSize: 15.0),
              //       ),
              //     ),
              //   ),
              // ),
>>>>>>>> 39a6f164dbeac5092b33baa0f730455124463510:lib/authentication/loginpage.dart
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Don\'t have an account?'),
                GestureDetector(
                  onTap: widget.showRegisterpage,
                  child: Text(
                    ' Register Here',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ]),
        ),
      )),
    );
  }
}

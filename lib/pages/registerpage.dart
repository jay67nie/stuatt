import 'package:flutter/material.dart';
import 'package:stuatt/authentication/message.dart';
import 'package:stuatt/authentication/register.dart';
import 'package:stuatt/authentication/register_lecturer.dart';

import '../authentication/sign_up.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _rePasswordController = TextEditingController();

//Future SignUp() async {
 // await FirebaseAuth.instance.createUserWithEmailAndPassword(
   // email: _emailController.text.trim(),
  //  password: _passwordController.text.trim(),
//  );
//}

//@override
//void dispose() {
 // _emailController.dispose();
 // _passwordController.dispose();
//}

class _RegisterPageState extends State<RegisterPage> {
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
            const Text('Hello There!'),
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
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Password'),
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
                      controller: _rePasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Re-enter password'),
                    ),
                  ),
                )),
            const SizedBox(
              height: 12,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed:() async {
                    if(_passwordController.text.trim() == _rePasswordController.text.trim()){

                    SignUp(
                    email: _emailController.text.trim(), 
                    password: _passwordController.text.trim())
                    .signUp().then((value) {
                      if (value == 'Success'){
                        if(_emailController.text.trim().contains("gmail")){

                          Navigator.pushReplacement(context, MaterialPageRoute<void>(
                              builder: (BuildContext  context){
                                return const RegisterStudent();
                              }
                          ),

                          );
                        }
                        else{
                          Navigator.pushReplacement(context, MaterialPageRoute<void>(
                              builder: (BuildContext  context){
                                return const RegisterLecturer();
                              }
                          ),

                          );
                        }
                        }

                      else{
                        final snackBar = SnackBar(content: Text(value!));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);




                      }


                      });}
                    else{
                      const snackBar = SnackBar(content: Text("The passwords don't match"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    }
                 },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  ),
                )),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already a member?'),
                GestureDetector(
                  onTap: widget.showLoginPage,
                  child: const Text(
                    '  Login Here',
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

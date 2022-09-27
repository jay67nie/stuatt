import 'package:flutter/material.dart';

void main(){
  runApp(formpage());
}

class formpage extends StatelessWidget{
  @override
    Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text('Attendance Registration Form'),
        ),
            body: aform()
    ),
    );
  }
}

class aform extends StatefulWidget{
  @override
  aformState createState() {
    return aformState();
  }
}

class aformState extends State<aform>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.abc_sharp),
              hintText: 'Enter your course',
                labelText: 'Course',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.abc_outlined),
              hintText: 'Enter your course unit',
              labelText: 'Course Unit',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.numbers_outlined),
              hintText: 'Enter the lecture number',
              labelText: 'Lecture Number',
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(child: ElevatedButton (
    onPressed: () {},
    child: const Text("Submit",
    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
    ),
    ),
    ],
    )
    ),
    ]),
  ]));
  }
}

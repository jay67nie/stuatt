import 'package:flutter/material.dart';
import 'package:stuatt/QRGeneration/generate.dart';



class MyForm extends StatefulWidget{
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _LecturerForm();


}

class _LecturerForm extends State<MyForm>{
  final _formKey = GlobalKey<FormState>();
  TextEditingController? courseUnitController;
  TextEditingController? lecNoController;
  TextEditingController? courseCodeController;


  @override
  void initState() {
    super.initState();
    courseUnitController = TextEditingController();
    lecNoController = TextEditingController();
    courseCodeController = TextEditingController();
  }

  @override
  void dispose() {
    courseUnitController?.dispose();
    lecNoController?.dispose();
    courseCodeController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(

     body: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: courseCodeController,
            decoration: const InputDecoration(
              icon: Icon(Icons.abc_sharp),
              hintText: 'Enter your course',
                labelText: 'Course',
            ),
          ),
          TextFormField(
              controller: courseUnitController,
            decoration: const InputDecoration(
              icon: Icon(Icons.abc_outlined),
              hintText: 'Enter your course unit',
              labelText: 'Course Unit',
            ),
          ),
          TextFormField(
            controller: lecNoController,
            decoration: const InputDecoration(
              icon: Icon(Icons.numbers_outlined),
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
                        Center(
                          child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ElevatedButton (
                          onPressed: () {Navigator.push(context, MaterialPageRoute(builder:(context) => StuAtt(
                            courseCode: courseCodeController!.text.trim(),
                            courseUnit: courseUnitController!.text.trim(),
                            lecNo: lecNoController!.text.trim()).myQR()


                          ));},
                          child: const Text("Submit",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
                        ),
                    )),
                      ],
                    )
                ),
              ]),
        ])));
  }
}

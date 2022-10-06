import 'package:flutter/material.dart';
import 'package:stuatt/class/attendance.dart';
import 'package:stuatt/class/lectureNumber.dart';
import 'package:stuatt/class/teaching.dart';

class ClassesWidget extends StatefulWidget {
  const ClassesWidget({Key? key}) : super(key: key);

  @override
  _ClassesWidgetState createState() => _ClassesWidgetState();
}

class _ClassesWidgetState extends State<ClassesWidget> {
  //bool lecturePage = false;
  bool got = false;
 // int toGet = 1;
  //late int clickIndex = 0;
  late List<dynamic> courses = <dynamic>[];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  //  getList(int x) async {
  //   if(x ==1) {
  //     var tempList = await Teaching().getCourses();
  //     courses = tempList;
  //     print(courses);
  //
  //     got = true;
  //     setState((){
  //     });
  //
  //   }
  //   if(x ==2) {
  //     print(courses);
  //
  //     var tempList = await LectureNo(courseUnit: courses[clickIndex]).getLecNo();
  //     courses = tempList;
  //     got =true;
  //     setState((){
  //     });
  //
  //   }
  //   if(x ==3) {
  //     print(courses);
  //     var tempList = await Attendance(cUnit: courses[clickIndex].toString()).getLecNo();
  //     courses = tempList;
  //     got = true;
  //     setState((){
  //     });
  //
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //if(!got) getList(toGet);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: !got? getCourses()

          : SingleChildScrollView(

            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: courses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15, 8, 15, 8),
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: const Color(0xFFF5F5F5),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Text(
                                "${index+1}.  ${courses[index]}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

          ),


        ),
      ),
    );
  }


  Widget getCourses(){

    final _formKey = GlobalKey<FormState>();
    TextEditingController? courseUnitController = TextEditingController();
    TextEditingController? lecNoController = TextEditingController();
    TextEditingController? courseCodeController = TextEditingController();
    return Form(
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
                                        onPressed: () async {
                                          courses = await Attendance(cUnit: courseUnitController.text.trim(),
                                          course: courseCodeController.text.trim(),
                                            lecNo: lecNoController.text.trim(),

                                          ).getLecNo();

                                          setState(() {

                                            got = true;


                                          });


                                        },
                                        child: const Text("Submit",
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
                                      ),
                                    )),
                              ],
                            )
                        ),
                      ]),
                ]));


  }
}

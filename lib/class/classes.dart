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
  bool lecturePage = false;
  bool got = false;
  int toGet = 1;
  late int clickIndex = 0;
  late List<dynamic> courses = <dynamic>[];
  final scaffoldKey = GlobalKey<ScaffoldState>();

   getList(int x) async {
    if(x ==1) {
      var tempList = await Teaching().getCourses();
      courses = tempList;
      got = true;
      setState((){
      });

    }
    if(x ==2) {
      var tempList = await LectureNo(courseUnit: courses[clickIndex]).getLecNo();
      courses = tempList;
      got =true;
      setState((){
      });

    }
    if(x ==3) {
      var tempList = await Attendance(cUnit: courses[clickIndex]).getLecNo();
      courses = tempList;
      got = true;
      setState((){
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    if(!got) getList(toGet);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
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
                        setState(() {
                          if(!lecturePage) {
                            setState((){
                              got = false;
                              toGet = 2;
                            });
                          lecturePage = !lecturePage;
                          }

                          else{
                            setState((){
                              got = false;
                              toGet = 3;
                            });
                            lecturePage = !lecturePage;

                          }


                        });

                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: const Color(0xFFF5F5F5),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Text(
                            courses[index],
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
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
    );
  }
}

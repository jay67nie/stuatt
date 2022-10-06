import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Teaching {
  late List<String> courseList = <String>[];
  Future<List> getCourses() async{

    var user = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance.collection("L").doc(user.uid).get().then((DocumentSnapshot ds){

      var courses = ds.data() as Map<String, dynamic>;
      print(courses);

      late Map<String, dynamic> val = courses["CUnits"];

      print(val);

      for(var s in val.keys) {
       courseList.add(s);
      }

      });
    print(courseList);
    return courseList;


  }

}
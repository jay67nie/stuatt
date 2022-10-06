

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LectureNo {
  LectureNo({required this.courseUnit});
  String courseUnit;
  late List<dynamic> lecNo;
  Future<List> getLecNo() async{
    var user = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance.collection("L").doc(user.uid).get().then((DocumentSnapshot ds) {
      print(ds.data());

      var courses = ds.data() as Map<String, dynamic>;
      print(courses);

      late Map<String, dynamic> val = courses["CUnits"];

      print(val);

      lecNo=val[courseUnit];
    });
    print(lecNo);
    return lecNo;


  }

}
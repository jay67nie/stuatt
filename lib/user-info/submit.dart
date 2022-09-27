

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Submit{
  String course;
  String courseUnit;
  String? stdNo;
  String lecNo;
  
  Submit({required this. course, required this.courseUnit, required this.lecNo});

  Future<String?> submit() async {

  try {
    var user = FirebaseAuth.instance.currentUser!;
      course+=DateTime.now().year.toString();
    FirebaseFirestore.instance.collection("S").doc(user.uid).get().then((DocumentSnapshot ds){
      ////// Complete this line to get stdNo.
      var myData = ds.data() as Map<String, dynamic>;
      print(myData);
      stdNo = myData["StdNo"];

    });
    DocumentReference db = FirebaseFirestore.instance.collection(course).doc(stdNo);
    db.set({courseUnit: {"Att": FieldValue.arrayUnion([int.parse(lecNo)])}}, SetOptions(merge: true));
  return "Success";
  }

  catch (e) {
    return e.toString();
  }

  }

}

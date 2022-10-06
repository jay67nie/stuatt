import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Create{

  Create({required this.courseCode, required this.lecNo});

  String courseCode, lecNo;

  Future<String?> registerDetails() async{

    var user = FirebaseAuth.instance.currentUser!;

    var names = <String, dynamic>{
      "CUnits": {
        courseCode: [int.parse(lecNo)]
      }

    };
    //add lecturer ID to CCode

    try{
      FirebaseFirestore.instance.collection("L").doc(user.uid).set(names, SetOptions(merge: true));
      return "Success";

    }

    catch (e) {
      return "Failure";
    }

  }


}
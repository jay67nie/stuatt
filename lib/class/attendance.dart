

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Attendance {
  Attendance({required this.cUnit, required this.lecNo, required this.course});
  String? lecNo;
  String? course;
  String? cUnit;

  late List<String> att = <String>[];
  Future<List> getLecNo() async{
   // Map<String, dynamic> courseUnit = {"Att": Null};
   // var user = FirebaseAuth.instance.currentUser!;
    course = course!+ DateTime.now().year.toString();
    await FirebaseFirestore.instance.collection(course!).get().then((QuerySnapshot qs) async {
        for(QueryDocumentSnapshot qds in qs.docs) {
          Map<String, dynamic> sData = qds.data() as Map<String, dynamic>;
          print(sData);
          if (sData.keys.contains(cUnit)){
            var attendance = sData[cUnit];
          print(attendance["Att"].contains(int.parse(lecNo!)));
          if (attendance["Att"].contains(int.parse(lecNo!))) {
            await FirebaseFirestore.instance.collection("S").doc(qds.id)
                .get()
                .then((DocumentSnapshot ds) {
              print(ds.data());
              var name = ds.data() as Map<String, dynamic>;
              print("added");
              att.add(name["StdNo"]!);
            });
          }
        }




        }

    });

    //   var courses = ds.data() as Map<String, dynamic>;
    //
    //   late Map<String, dynamic> val;
    //
    //   courses.forEach((key, value) {
    //     val = value as Map<String, dynamic>;
    //   });
    //
    //   if(val.keys.contains(lecNo)){
    //
    //     att = val[lecNo] as List<String>;
    //   }
    //
    //
    // });
    print("We reached");
    print(att);
    return att;


  }


  // static void getCourse(String c, String l){
  //   lecNo = l;
  //   course = c;
  //   course!=course!+DateTime.now().year.toString();
  // }

}
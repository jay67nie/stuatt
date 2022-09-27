import 'package:cloud_firestore/cloud_firestore.dart';

class Submit{
  String course;
  String courseUnit;
  String stdNo;
  String lecNo;

  Submit({required this.course, required this.courseUnit, required this.stdNo, required this.lecNo});

  Future<String?> submit() async {

  try {
    DocumentReference db = FirebaseFirestore.instance.collection(course).doc(stdNo);
    db.update({"Att": FieldValue.arrayUnion([lecNo])});
  return "Success";
  }

  catch (e) {
    return e.toString();
  }

  }

}

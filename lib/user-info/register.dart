import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register{
  
  Register({required this.firstName, required this.lastName, required this.type, this.third});
  
  String firstName, lastName, type;
  String? third;

  Future<String?> registerDetails() async{

    var user = FirebaseAuth.instance.currentUser!;

    try{
      user.updateDisplayName("$firstName $lastName");

      if(type == 'S') FirebaseFirestore.instance.collection(type).doc(user.uid).set({"StdNo": third!});

      return "Success";

    }

    catch (e) {
      return "Failure";
    }

  }


}
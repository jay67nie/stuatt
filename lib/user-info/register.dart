import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register{
  
  Register({required this.firstName, required this.lastName, required this.third, required this.type});
  
  String firstName, lastName, third, type;

  Future<String?> registerDetails() async{

    var user = FirebaseAuth.instance.currentUser!;
    
    var names = <String, String>{
      "Name": "$firstName $lastName",
      if(type == 'S') "StdNo": third,

    };
    //third is stdNO

    try{
      FirebaseFirestore.instance.collection(type).doc(user.uid).set(names);
      return "Success";

    }

    catch (e) {
      return "Failure";
    }

  }


}
import 'package:cloud_firestore/cloud_firestore.dart';

class Register{
  
  Register({required this.firstName, required this.lastName, required this.third, required this.type});
  
  String firstName, lastName, third, type;

  Future<String?> registerDetails() async{
    
    var names = <String, String>{
      "Fname": firstName,
      "Lname": lastName,

      if(type == "S") "StdNo": third,
      if(type == "L") "CCode": third+DateTime.now().year.toString(),
    };

    try{
      FirebaseFirestore.instance.collection(type).doc(third).set(names);
      return "Success";

    }

    catch (e) {
      return "Failure";
    }

  }


}
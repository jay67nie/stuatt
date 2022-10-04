import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stuatt/QRGeneration/before_page.dart';
import 'package:stuatt/QRScan/ScanQR.dart';
import 'register.dart';
import 'register_lecturer.dart';


class VerificationMessageWidget extends StatefulWidget {
  const VerificationMessageWidget({Key? key}) : super(key: key);

  @override
  State<VerificationMessageWidget> createState() =>
      _VerificationMessageWidgetState();
}

class _VerificationMessageWidgetState extends State<VerificationMessageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Timer timer;

  @override
  void initState() {
    User user = FirebaseAuth.instance.currentUser!;
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      user.reload();
      if (user.emailVerified){ timer.cancel();
      Navigator.pushReplacement(context,  MaterialPageRoute<void>(
          builder: (BuildContext context) {
            print("Finally");
            if(user.email!.contains("outlook")){

              return const RegisterLecturer();
            }
            else{
              return const RegisterStudent();
            }

          }),);
      
    }});




    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 0, 100),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 8,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Text(
                                'A verification message has been sent to your email.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  height: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

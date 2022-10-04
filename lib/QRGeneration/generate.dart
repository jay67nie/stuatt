import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stuatt/QRScan/ScanQR.dart';
import 'package:stuatt/class/classes.dart';
import 'QR.dart';

class StuAtt {

 static String? courseCode;

  static String? courseUnit;

  static String? lecNo;

  static String? code;

  static String? myQRData(String cC, String cU, String lN) {
    courseCode = cC+DateTime.now().year.toString();
    courseUnit = cU;
    lecNo = lN;
    code = "$courseCode $courseUnit $lecNo";
    return code;
  }

  Widget myQR(){
    return const QR();

  }
}
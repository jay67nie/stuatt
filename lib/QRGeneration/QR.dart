import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stuatt/QRGeneration/generate.dart';
import 'package:stuatt/QRScan/ScanQR.dart';
import 'package:stuatt/class/classes.dart';
import 'QRBody.dart';

class QR extends StatefulWidget{

  const QR({super.key});

  @override
  State<QR> createState() {
    return QRHome();
  }


}

class QRHome extends State<QR>{
  int currentPage = 0;
  List<Widget> pages = [
    QRBody(data: StuAtt.code),
    const ClassesWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('StuAtt')
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.camera), label: "QR Code"),
            NavigationDestination(icon: Icon(Icons.list), label: "Attendance")
          ],
          onDestinationSelected: (int index){
            setState(() {currentPage = index;});


          },
          selectedIndex: currentPage,
        ),
        body: pages[currentPage]
    );
    throw UnimplementedError();
  }

}
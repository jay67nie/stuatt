import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const StuAtt());
}

class StuAtt extends StatelessWidget {
  const StuAtt({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'STuAtt',
        home: Scaffold(
          appBar: AppBar(
              title: const Text('ATTENDANCE QR CODE GENERATOR')
          ),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: QrImage(
                                  data: 'CSC2022 CSC1202 1',
                                  version: QrVersions.auto,
                                  size: (200),
                                  gapless: false,
                                  errorStateBuilder: (cxt, err) {
                                    return Container(
                                      child: const Center(
                                        child: Text(
                                          'Something Went Wrong',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            )
                          ]
                      )
                  ),
                  ElevatedButton(onPressed: (){},
                    child: const Text("Generate QR Code",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),),
                  ),
                ]
            ),
          ),
        )
    );
  }
}
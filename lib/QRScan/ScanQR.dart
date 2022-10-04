import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:stuatt/class/classes.dart';
import 'package:stuatt/user-info/submit.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({super.key});

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  int currentPage = 0;
  List<Widget> pages = const [
    ScanQR(),
    ClassesWidget(),
  ];
  ScanResult? scanResult;

  final _flashOnController = TextEditingController(text: 'Flash on');
  final _flashOffController = TextEditingController(text: 'Flash off');
  final _cancelController = TextEditingController(text: 'cancel');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: AppBar(
            title: const Text('QR Code Scanner'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: _scan,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.camera, size: 24.0),
                    Text('Click Me!'),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ),
              )
            ],
          ));

  }

  _scan() async {
    final result = await BarcodeScanner.scan(
      options: ScanOptions(
        strings: {
          'cancel': _cancelController.text,
          'flash_on': _flashOnController.text,
          'flash_off': _flashOffController.text,
        },
      ),
    );


      scanResult = result;
      print(scanResult);
      print(scanResult!.rawContent);

      List<String> codes = <String>[];
      codes = scanResult!.rawContent.split(" ");

      await Submit(course: codes[0], courseUnit: codes[1], lecNo: codes[2]).submit().then((value){

        var snackBar = SnackBar(
          content: Text(value!),);

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

      });






  }
}

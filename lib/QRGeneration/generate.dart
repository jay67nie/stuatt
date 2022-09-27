import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class StuAtt {
  Scaffold myQR() {
    return Scaffold(
          appBar: AppBar(
              title: const Text('StuAtt')
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
                ]
            ),
          ),
        );
  }
}
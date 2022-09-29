import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class StuAtt {
  String courseCode;

  String courseUnit;

  String lecNo;

  StuAtt({required this.courseCode, required this.courseUnit, required this.lecNo});
  Scaffold myQR() {
    courseCode+=DateTime.now().year.toString();
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
                                  data: "$courseCode $courseUnit $lecNo",
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
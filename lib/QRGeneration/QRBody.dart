import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRBody extends StatelessWidget{
 final String? data;

  const QRBody({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                data: data!,
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
    throw UnimplementedError();
  }



}
import 'package:flutter/material.dart';
import 'package:stuatt/QRGeneration/before_page.dart';
import 'package:stuatt/QRGeneration/generate.dart';
import 'package:stuatt/QRGeneration/middlepage.dart';


class GeneratePage extends StatelessWidget {
  const GeneratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('StuAtt')
        ),
        body:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: ElevatedButton (
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const MyForm()));},
                        child: const Text("Generate QR Code",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
                      ),
                      ),
                    ]
                ),
              ),
            ]
        )
    );
  }
}

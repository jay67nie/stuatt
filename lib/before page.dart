import 'package:flutter/material.dart';
import 'package:stuatt/generate.dart';

void main(){
  runApp(const generatepage());
}

class generatepage extends StatelessWidget {
  const generatepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'STuAtt',
        home: myHome(),
    );
  }
}

class myHome extends StatelessWidget{
  const myHome({super.key});

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
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => StuAtt().myQR()));},
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

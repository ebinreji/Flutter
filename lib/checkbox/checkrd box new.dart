import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Checkeg(),));
}

class Checkeg extends StatefulWidget {
  const Checkeg({super.key});

  @override
  State<Checkeg> createState() => _CheckegState();
}

class _CheckegState extends State<Checkeg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(300),
              child: Container(
            child: Image(image: AssetImage("assets/image/Canada.jpeg")),
          )),
          ClipRRect(
              child: Container(            child: Image(image: AssetImage("assets/image/Canada.jpeg")),
          )),
          ClipRRect(
              child: Container(
            child: Image(image: AssetImage("assets/image/Canada.jpeg")),
          )),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splashpg(),));
}
class Splashpg extends StatefulWidget {
  const Splashpg({super.key});

  @override
  State<Splashpg> createState() => _SplashpgState();
}

class _SplashpgState extends State<Splashpg> {
  @override
  void initState() {
    Timer(Duration(seconds: 2),(){});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("WELCOME...",style: TextStyle(
                fontSize: 30,fontWeight: FontWeight.bold,
              ),)
            ],
          ),
        ),
      )
    );
  }
}

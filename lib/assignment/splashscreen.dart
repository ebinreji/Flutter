import 'dart:async';

import 'package:flutter/material.dart';
import 'package:julyfultterproject/assignment/loginpagehotel.dart';
import 'package:julyfultterproject/assignment/registrationhotel.dart';
void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: Splashscreen1(),));
}

class Splashscreen1 extends StatefulWidget {
  const Splashscreen1({super.key});

  @override
  State<Splashscreen1> createState() => _Splashscreen1State();
}

class _Splashscreen1State extends State<Splashscreen1> {
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpagehotel()));
    } );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          image: DecorationImage(
              image: AssetImage("assets/image/Hotel.png"),

             ),
        ),
      ),

    );
  }
}

import 'dart:async';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:julyfultterproject/loginpage.dart';
import 'package:julyfultterproject/loginwithvalidation.dart';
import 'package:julyfultterproject/registration%20page.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splashscreen(),));
}
class Splashscreen extends StatefulWidget {

  const Splashscreen({super.key});


  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 1), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
    } );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/image/Grey.jpg"),
    fit: BoxFit.fill),
    ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "MARK ANTONY",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal),
              ),
            ],
          ),
        ),
    ),
    );
  }
}

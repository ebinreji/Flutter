import 'package:flutter/material.dart';
import 'package:julyfultterproject/custom%20widget/customwidget.dart';
import 'package:julyfultterproject/loginpage.dart';
void main(){
  runApp(MaterialApp(home: Customeg(),));
}

class Customeg extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Customwidget(
          img: Image(image: AssetImage("assets/image/switzerland.jpeg")),
          title: Text("login"),
          onpress: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) =>  loginpage()));
          },),
      ),
    );
  }
}

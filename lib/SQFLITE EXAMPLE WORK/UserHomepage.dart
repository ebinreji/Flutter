import 'package:flutter/material.dart';
import 'package:julyfultterproject/SQFLITE%20EXAMPLE%20WORK/loginpg.dart';

class UserHomepage extends StatelessWidget {
  var data;
 UserHomepage({Key? key, required this.data}):super(key:key);
  @override
  Widget build(BuildContext context) {
    var name =data[0]['name'];
    var email =data[0]['email'];
    return Scaffold(
    appBar: AppBar(title: Text("Welcome $name"),),
      body: Center(
      child: Text("Hey.... $email"),
      )
    );
  }
}

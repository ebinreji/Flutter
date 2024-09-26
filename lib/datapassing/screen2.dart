import 'package:flutter/material.dart';
import 'package:julyfultterproject/datapassing/datastore1.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    final id=ModalRoute.of(context)?.settings.arguments;
    final data=datastore1.firstWhere((product)=>product["id"]==id);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("${data["name"]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Center(child: Image(image: AssetImage("${data["image"]}"))),
            Text("${data["rate"]}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Text("${data["description"]}"),
          ],
        ),
      ),
    );
  }
}

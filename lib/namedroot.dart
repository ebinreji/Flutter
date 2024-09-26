import 'package:flutter/material.dart';
import 'package:julyfultterproject/Grid%20view%20count.dart';
import 'package:julyfultterproject/list%20view%20builder.dart';
void main(){
  runApp(MaterialApp(home: Namedroot(),
  routes: {
    "grid":(context)=>Listbuilder(),
      "list":  (context)=>Gridviewcount(),
  },));
}

class Namedroot extends StatelessWidget {
  const Namedroot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){Navigator.pushNamed(context, "grid");}, child:Text("screen1")),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, "list");
          }, child:Text("screen2")),
        ],
      ),
    );
  }
}

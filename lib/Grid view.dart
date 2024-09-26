import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Gridview1()));
}
class Gridview1 extends StatefulWidget {
  const Gridview1({super.key});

  @override
  State<Gridview1> createState() => _Gridview1State();
}

class _Gridview1State extends State<Gridview1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
      children: [
        Container(child: Center(child: Text("608"),),color: Colors.red,),
        Container(child: Center(child: Text("1208"),),color: Colors.blue,),
        Container(child: Center(child: Text("6203"),),color: Colors.yellow),
        Container(child: Center(child: Text("7142"),),color: Colors.orange,),
        Container(child: Center(child: Text("1537"),),color: Colors.pink,),
        Container(child: Center(child: Text("8129"),),color: Colors.purple,),

      ],),

    );
  }
}

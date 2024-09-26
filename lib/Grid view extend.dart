import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main(){
  runApp(MaterialApp(home: Gridviewextd(),));
}
class Gridviewextd extends StatefulWidget {
  const Gridviewextd({super.key});

  @override
  State<Gridviewextd> createState() => _GridviewextdState();
}

class _GridviewextdState extends State<Gridviewextd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 100,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10),
      children: [
        Container(child: Center(child:Icon(FontAwesomeIcons.facebook)),color: Colors.red,),
        Container(child: Center(child: Text("1208"),),color: Colors.blue,),
        Container(child: Center(child: Text("6203"),),color: Colors.yellow),
        Container(child: Center(child: Text("7142"),),color: Colors.orange,),
        Container(child: Center(child: Text("1537"),),color: Colors.pink,),
        Container(child: Center(child: Text("8129"),),color: Colors.purple,),
      ],),
    );
  }
}

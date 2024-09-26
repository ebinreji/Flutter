import 'package:flutter/material.dart';
import 'package:julyfultterproject/datapassing/datastore.dart';
import 'package:julyfultterproject/datapassing/secondscreen.dart';
void main(){
  runApp(MaterialApp(home: Firstscreen(),
  debugShowCheckedModeBanner: false,
  routes: {
    "secondscreen":(context)=>Secondscreen(),
  },));
}

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: datastore.map((product)=>
          GestureDetector(
            child: Column(
              children: [
                Image(image: AssetImage(product["image"])),
                Text(product["name"])
              ],
            ),
            onTap: ()=>getproduct(context,product["id"]),)).toList(),


      )
      );
  }
  void getproduct(BuildContext context,product){
    Navigator.pushNamed(context, "secondscreen",arguments: product);
  }
}

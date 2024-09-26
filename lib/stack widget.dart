import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Stackeg(),
  ));
}

class Stackeg extends StatefulWidget {
  const Stackeg({super.key});

  @override
  State<Stackeg> createState() => _StackegState();
}

class _StackegState extends State<Stackeg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         Container(
              color: Colors.red,
              height: 500,
              width:double.infinity,
            ),

         Positioned(height: 100,width: 200,top: 50,left: 60,
           child: Center(
             child: Container(
                  color: Colors.blue,
                  height:double.infinity,
                  width:double.infinity,
                ),
           ),
         ),

          Positioned(
            child: Container(
              color: Colors.green,
              height: 100,
              width: 80,

            ),
            left: 100,top: 220,height: 250,width: 50,

          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Atmcard(),
  debugShowCheckedModeBanner: false,));
}

class Atmcard extends StatefulWidget {
  const Atmcard({super.key});

  @override
  State<Atmcard> createState() => _AtmcardState();
}

class _AtmcardState extends State<Atmcard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFDA6162),
      body: Container(alignment: Alignment.center,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/Atmbackground.jpg")),),
       child: Stack(
         children: [
           Positioned(left: 199,top: 15,
               child: Image(image: AssetImage("assets/image/atm_logo.png"),)),
           Positioned(left: 35,top: 280,
             child: Image(image: AssetImage("assets/image/atm_chip.png"),height: 115,width: 115,)),
           Positioned(left: 435,top: 280,
               child: Image(image: AssetImage("assets/image/atm_contactless.png"),height: 105,width: 115,color: Colors.white,)),
           Positioned(left: 120,top: 382,
               child: Text("6522 32100 2345 9876",style:TextStyle(fontSize: 30,color: Colors.white),)),

         ],
       ),
      ),

    );
  }
}

import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: Gridviewexample(),
  debugShowCheckedModeBanner: false,
  ));
}
class Gridviewexample extends StatefulWidget {
  const Gridviewexample({super.key});

  @override
  State<Gridviewexample> createState() => _GridviewexampleState();
}

class _GridviewexampleState extends State<Gridviewexample> {
  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid view Builder"),
      backgroundColor: Colors.blue[500],
      ),
      body: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      mainAxisSpacing: 10,
      mainAxisExtent: 100,
      crossAxisSpacing: 10),

      children: [

        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(Icons.directions_car),Text("Car"),
          ],
        ),
          color: Colors.lightGreen,),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.directions_bike),Text("Bicycle"),
          ],
        ),
          color: Colors.lightBlueAccent,),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.directions_boat),Text("boat"),
          ],
        ),
          color: Colors.blue[100],),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.directions_bus),Text("Bus"),
          ],
        ),
          color: Colors.green,),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.directions_train),Text("train"),
          ],
        ),
          color: Colors.brown,),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.directions_walk),Text("Walk"),
          ],
        ),
          color: Colors.lightGreenAccent,),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.contact_mail),Text("Contact"),
          ],
        ),
          color: Colors.blue[100],),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.duo),Text("Duo"),
          ],
        ),
          color: Colors.green,),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hourglass_empty),Text("hour"),
          ],
        ),
          color: Colors.blue[100],),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.phone_android),Text("mobile"),
          ],
        ),
          color: Colors.green,),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.message),Text("message"),
          ],
        ),
          color: Colors.brown,),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.vpn_key),Text("key"),
          ],
        ),
          color: Colors.lightGreenAccent,),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.wifi),Text("wifi"),
          ],
        ),
          color: Colors.blue[100],),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.bluetooth),Text("bluetooth"),
          ],
        ),
          color: Colors.grey,),
        Container(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.tag_faces),Text("smile"),
          ],
        ),
          color: Colors.pink,),
      ],),

    );
  }
}

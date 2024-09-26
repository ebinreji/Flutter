import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Gridviewextend(),));
}
class Gridviewextend extends StatefulWidget {
  const Gridviewextend({super.key});

  @override
  State<Gridviewextend> createState() => _GridviewextendState();
}

class _GridviewextendState extends State<Gridviewextend> {
  var icon=[
    Icons.person,
    Icons.local_taxi,
    Icons.calendar_today,
    Icons.navigation,
    Icons.help,
    Icons.phone,
    Icons.settings,
    Icons.logout];
  var data=[
    "My profile",
    "Book a cab",
    "Booking Schedule",
    "Track Your Cab",
    "Help & Feedback",
    "Call to transport",
    "Settings",
    "Log-out"];
  var color=[
    Colors.grey,
    Colors.pink,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.pink];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(maxCrossAxisExtent: 150,
      children: List.generate(icon.length,(index){
        return Card(color: color[index],
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon[index]),
              Text(data[index]),
            ],
          ),
        );
      }),
      ),
    );
  }
}

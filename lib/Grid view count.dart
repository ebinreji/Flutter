import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Gridviewcount extends StatefulWidget {
  const Gridviewcount({super.key});

  @override
  State<Gridviewcount> createState() => _GridviewcountState();
}

class _GridviewcountState extends State<Gridviewcount> {
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
      body: GridView.count(crossAxisCount: 3,
      children:List.generate(icon.length,(index){
        return Card(color:color[index],
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon[index]),
            Text(data[index],style: GoogleFonts.abrilFatface(
              fontSize: 20
            ),),
          ],)
        );
    }),

    ),
    );
  }
}


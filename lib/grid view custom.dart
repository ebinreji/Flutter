import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Gridviewcustom(),));
}
class Gridviewcustom extends StatefulWidget {

  @override
  State<Gridviewcustom> createState() => _GridviewcustomState();
}

class _GridviewcustomState extends State<Gridviewcustom> {
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
      body: GridView.custom(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          childrenDelegate: SliverChildBuilderDelegate((context,index){
            return Card(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon[index]),
                  Text(data[index],style: GoogleFonts.abel(
                    fontSize: 20
                  )),
                ],
              ),
            );
          },childCount: icon.length
          ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:julyfultterproject/custom%20widget/customwidgetnew.dart';
void main(){
  runApp(MaterialApp(home:Customgrid() ,));
}

class Customgrid extends StatefulWidget {
  @override
  State<Customgrid> createState() => _CustomgridState();
}

class _CustomgridState extends State<Customgrid> {
  var color = [
    Colors.grey,
    Colors.pink,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.pink
  ];
  var data = [
    "My profile",
    "Book a cab",
    "Booking Schedule",
    "Track Your Cab",
    "Help & Feedback",
    "Call to transport",
    "Settings",
    "Log-out"
  ];
  var image=["assets/image/Grey.jpg","assets/image/background.jpg","assets/image/Grey.jpg",
    "assets/image/background.jpg","assets/image/Grey.jpg","assets/image/Grey.jpg","assets/image/background.jpg","assets/image/Grey.jpg",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Customgridwidget(
            img: Image.network(image[index]),

            text: Text(data[index]),
            clr: color[index],
          );
        },
        itemCount: data.length,
      ),
    );
  }
}

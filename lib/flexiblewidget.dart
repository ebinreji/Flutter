import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Flexiblewidget(),
  ));
}

class Flexiblewidget extends StatefulWidget {
  const Flexiblewidget({super.key});

  @override
  State<Flexiblewidget> createState() => _FlexiblewidgetState();
}

class _FlexiblewidgetState extends State<Flexiblewidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              flex: 2,
              child: Container(
                color: Colors.blue,
              )),
          Flexible(
              flex: 3,
              child: Container(
                color: Colors.red,
              )),
          Flexible(
              flex: 2,
              child: Container(
                color: Colors.yellow,
              )),
          Flexible(
              flex: 1,
              child: Container(
                color: Colors.brown,
              )),
          Flexible(
              flex: 3,
              child: Container(
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Expandedwidget(),
  ));
}

class Expandedwidget extends StatefulWidget {
  const Expandedwidget({super.key});

  @override
  State<Expandedwidget> createState() => _ExpandedwidgetState();
}

class _ExpandedwidgetState extends State<Expandedwidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.yellow,
              height: 100,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              height: 100,
              width: double.infinity,
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.blue,
            height: 100,
            width: double.infinity,
          )),
        ],
      ),
    );
  }
}

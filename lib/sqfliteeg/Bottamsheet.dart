import 'package:flutter/material.dart';
import 'package:julyfultterproject/sqfliteeg/home1.dart';
import 'package:julyfultterproject/sqfliteeg/profilepg.dart';

void main() => runApp(MaterialApp(
  home: Homepg(data: 'some data'),  // Pass actual data if needed
  debugShowCheckedModeBanner: false,
));

class Homepg extends StatefulWidget {
  final dynamic data;
  Homepg({Key? key, required this.data}) : super(key: key);

  @override
  State<Homepg> createState() => _HomepgState();
}

class _HomepgState extends State<Homepg> {
  int index = 0;
  late List<Widget> screen;

  @override
  void initState() {
    super.initState();
    screen = [
      Home1(),
      Profilepg(data1: widget.data),  // Use widget.data here
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (tapIndex) {
          setState(() {
            index = tapIndex;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.yellow,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: screen[index],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:julyfultterproject/assignment/chat.dart';
import 'package:julyfultterproject/assignment/tab.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Whatsapp(),
  ));
}

class Whatsapp extends StatefulWidget {
  const Whatsapp({super.key});

  @override
  State<Whatsapp> createState() => _WhatsappState();
}

class _WhatsappState extends State<Whatsapp> {

  int index = 0;
  var screen = [
    Center(
        child: Text(
      "Profile",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    )),
    Center(
        child: Text(
      "Status",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    )),
    Center(
        child: Text(
      "Community",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    )),
    Center(
        child: Text(
      "Contact",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("WhatsApp",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.green[500])),
        actions: [
          Icon(
            Icons.qr_code_scanner_rounded,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.camera_enhance_outlined,
              color: Colors.black,
            ),
          ),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(child: Text("New group")),
              PopupMenuItem(child: Text("New broadcast")),
              PopupMenuItem(child: Text("Linked devices")),
              PopupMenuItem(child: Text("Starred messages")),
              PopupMenuItem(child: Text("Payments")),
              PopupMenuItem(child: Text("Settings")),
            ];
          }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (tapindex) {
            setState(() {
              index = tapindex;
            });
          },
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.update,
              ),
              label: "Status",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people,
              ),
              label: "Community",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.phone,
              ),
              label: "Calls",
            ),
          ]),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Search....",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Expanded(
              child: index == 0 ? Chat() : screen[index],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat_bubble_outline),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
    );
  }
}

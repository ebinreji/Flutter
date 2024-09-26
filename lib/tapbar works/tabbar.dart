import 'package:flutter/material.dart';
import 'package:julyfultterproject/Gridviewextend.dart';
import 'package:julyfultterproject/home%20page.dart';
import 'package:julyfultterproject/listcustom_delegate.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Tabbareg(),
  ));
}

class Tabbareg extends StatefulWidget {
  const Tabbareg({super.key});

  @override
  State<Tabbareg> createState() => _TabbaregState();
}

class _TabbaregState extends State<Tabbareg> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "Whatsapp",
          ),
          actions: [
            Icon(
              Icons.search,
            ),
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(child: Text("Invite")),
                PopupMenuItem(child: Text("Refresh")),
                PopupMenuItem(child: Text("Logout")),
              ];
            }),
          ],
          bottom: TabBar(
              labelColor: Colors.white,
              dividerColor: Colors.black,
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  child: Icon(Icons.camera_alt),
                ),
                Tab(
                  child: Text("Chat"),
                ),
                Tab(
                  child: Text("Status"),
                ),
                Tab(
                  child: Text("Contact"),
                ),
              ]),
        ),
        body: TabBarView(children: [
          Center(
            child: Icon(Icons.camera_alt),
          ),
          Listcustomdelegate(),
          Gridviewextend(),
          Homepage(),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.message),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

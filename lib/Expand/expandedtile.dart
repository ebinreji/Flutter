import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Expandedtile(),));
}

class Expandedtile extends StatefulWidget {
  const Expandedtile({super.key});

  @override
  State<Expandedtile> createState() => _ExpandedtileState();
}

class _ExpandedtileState extends State<Expandedtile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ExpansionTile(backgroundColor: Colors.lime[100],
            title: Text("Light colors"),
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                ),
                title: Text("lightGreen"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                ),
                title: Text("redAccent"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                ),
                title: Text("blueAccent"),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.yellowAccent,
                ),
                title: Text("yellowAccent"),
              ),

            ],
          ),
          ExpansionTile(backgroundColor:Colors.white30,title: Text("Dark colors"),
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
              ),
              title: Text("black"),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
              ),
              title: Text("red"),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.brown,
              ),
              title: Text("brown"),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
              ),
              title: Text("grey"),
            ),
          ],)
        ],
      ),
    );
  }
}

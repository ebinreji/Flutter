import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Assignment2(),
  ));
}

class Assignment2 extends StatelessWidget {
  var name = ["Harold", "Noyal", "Aju", "Anugrah", "Hari", "Vidhu", "yedhu"];
  var num = [
    "9852641300",
    "9955664421",
    "9975412367",
    "9188425687",
    "9961478563",
    "7854213600",
    "6287910345"
  ];
  var color = [
    Colors.blue,
    Colors.pink,
    Colors.orange,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Contact List"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: color[index],
                child: Icon(Icons.person_4),
              ),
              title: Text(name[index]),
              subtitle: Text(num[index]),
              trailing: Icon(Icons.arrow_right),
            ),
          );
        },
        itemCount: name.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Chat(),
  ));
}

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var name = [
    "amal",
    "Rahul",
    "Noyal",
    "Hari",
    "ebi",
    "vidhu",
    "ashwin",
    "akhin",
    "ann",
    "ani",
    "yedhu",
    "jithin",
    "jibin"
  ];
  var phone = [
    "on the way",
    "12.00pm",
    "hello",
    "evideya?",
    "gd mrng",
    "hlo",
    "hi",
    "yep",
    "illa",
    "456",
    "yss yss",
    "und",
    "no way",
  ];
  var image = [
    "assets/image/Grey.jpg",
    "assets/image/background.jpg",
    "assets/image/Grey.jpg",
    "assets/image/background.jpg",
    "assets/image/Grey.jpg",
    "assets/image/Londan.jpeg",
    "assets/image/usa1.jpeg",
    "assets/image/canada1.jpeg",
    "assets/image/finland1.jpeg",
    "assets/image/switzerland.jpeg",
    "assets/image/havasu_falls.jpeg",
    "assets/image/portugal.jpeg",
    "assets/image/oceania.jpeg"
  ];
  var color = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  var values = [
    "10.30am",
    "10.45am",
    "10.00am",
    "9.40am",
    "8.00am",
    "8.00am",
    "7.50am",
    "7.49am",
    "5.00am",
    "11.40pm",
    "11.49pm",
    "11.40pm",
    "10.30pm"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(image[index]),
                ),
                title: Text(name[index]),
                subtitle: Text(phone[index]),
                trailing: Text(" ${values[index]}"),
              ),
            );
          },
          childCount: name.length,
        ),
      ),
    );
  }
}

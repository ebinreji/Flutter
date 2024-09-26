import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scrollview(),
  ));
}

class Scrollview extends StatefulWidget {
  const Scrollview({super.key});

  @override
  State<Scrollview> createState() => _ScrollviewState();
}

class _ScrollviewState extends State<Scrollview> {
  var name = [
    "amal",
    "Rahul",
    "Noyal",
    "Hari",
    "ebi",
    "amal",
    "Rahul",
    "Noyal",
    "Hari",
    "ebi",
    "amal",
    "Rahul",
    "Noyal",
    "Hari",
    "ebi",
    "amal",
    "Rahul",
    "Noyal",
    "Hari",
    "ebi"
  ];
  var phone = [
    "9961148414",
    "9188422099",
    "9188422000",
    "9188777799",
    "9188987699",
    "9961148414",
    "9188422099",
    "9188422000",
    "9188777799",
    "9188987699",
    "9961148414",
    "9188422099",
    "9188422000",
    "9188777799",
    "9188987699",
    "9961148414",
    "9188422099",
    "9188422000",
    "9188777799",
    "9188987699"
  ];
  var image = [
    "assets/image/Grey.jpg",
    "assets/image/background.jpg",
    "assets/image/Grey.jpg",
    "assets/image/background.jpg",
    "assets/image/Grey.jpg",
    "assets/image/Grey.jpg",
    "assets/image/background.jpg",
    "assets/image/Grey.jpg",
    "assets/image/background.jpg",
    "assets/image/Grey.jpg",
    "assets/image/Grey.jpg",
    "assets/image/background.jpg",
    "assets/image/Grey.jpg",
    "assets/image/background.jpg",
    "assets/image/Grey.jpg",
    "assets/image/Grey.jpg",
    "assets/image/background.jpg",
    "assets/image/Grey.jpg",
    "assets/image/background.jpg",
    "assets/image/Grey.jpg"
  ];
  var color = [
    Colors.grey,
    Colors.pink,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.pink,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.pink,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.grey,
    Colors.pink,
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.green
  ];
  var icons = [
    Icons.account_balance,
    Icons.add_alert,
    Icons.access_alarms_rounded,
    Icons.add_circle,
    Icons.ac_unit,
    Icons.insert_comment_rounded,
    Icons.account_balance,
    Icons.add_alert,
    Icons.access_alarms_rounded,
    Icons.add_circle,
    Icons.ac_unit,
    Icons.insert_comment_rounded,
    Icons.account_balance,
    Icons.add_alert,
    Icons.access_alarms_rounded,
    Icons.add_circle,
    Icons.ac_unit,
    Icons.insert_comment_rounded,
    Icons.account_balance,
    Icons.add_alert,
    Icons.access_alarms_rounded,
    Icons.add_circle,
    Icons.ac_unit,
    Icons.insert_comment_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          title: Text("CUSTOM",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.send),color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),color: Colors.white,
            ),
          ],
          bottom: AppBar(
              title: Container(
            color: Colors.white,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: "search somthing....",
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          )),
          expandedHeight: 140,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                color: color[index],
                child: ListTile(
                  leading: Image(image: AssetImage(image[index])),
                  title: Text(name[index]),
                  subtitle: Text(phone[index]),
                ),
              );
            },
            childCount: name.length,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(color: Colors.blue,
            height: 50,
            child: Text(
              "Sliver Grid.....",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Center(
                child: Card(
                  color: color[index],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text(name[index])),
                      Center(child: Icon(icons[index])),
                    ],
                  ),
                ),
              );
            }, childCount: name.length),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
      ]
      ),
    );
  }
}

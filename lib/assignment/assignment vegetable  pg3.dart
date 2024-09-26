import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Assignmentpg3(),
    debugShowCheckedModeBanner: false,
  ));
}

class Assignmentpg3 extends StatefulWidget {
  const Assignmentpg3({super.key});

  @override
  State<Assignmentpg3> createState() => _Assignmentpg3State();
}

class _Assignmentpg3State extends State<Assignmentpg3> {
  var image = [
    "assets/image/pork.jpeg",
    "assets/image/banana.jpeg",
    "assets/image/veg3.jpeg",
    "assets/image/Potato.jpeg",
    "assets/image/tomato2.jpeg"
  ];
  var name = [
    "pork (2kg)",
    "Banana (2kg)",
    "Cabbage (1kg)",
    "Potato (2kg)",
    "Tomato (2kg)"
  ];
  var price = ["52.25", "10", "11.25", "24.60", "8.40"];
  var details=["Processing","Pending","Pending","Delivered","Delivered"];
  var date =["22/09/2024","20/09/2024","20/09/2024","19/09/2024","19/09/2024"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Order",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
                      Text("Back"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottom: TabBar(labelColor: Colors.white,
              dividerColor: Colors.white,
              indicator:BoxDecoration(shape: BoxShape.rectangle,color: Colors.green,borderRadius: BorderRadius.circular(10)),
              unselectedLabelColor: Colors.black,
              tabs: [
          Center(child: Tab(child:Text(" All 5 ") )),
          Center(child: Tab(child: Text(" Processing "),)),
          Center(child: Tab(child: Text(" Pending "),)),
          Center(child: Tab(child: Text(" Deliverd "),)),
          ]),
        ),

        body: ListView.separated(itemBuilder: (context, index) {
          return Container(
            child: ListTile(
              leading: Image(
                fit: BoxFit.cover,
                width: 100,
                height: 120,
                image: AssetImage(image[index]),
              ),
              title: Text(
                name[index],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$ ${price[index]}",
                    style: TextStyle(color: Colors.green),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(details[index]),
                      Text(date[index]),
                    ],
                  )
                ],
              ),
            ),
          );
        },separatorBuilder: (context, index) {
      return Divider(
      thickness: 7,
      color: Colors.white,
      );
      },itemCount: image.length),
      ),
    );
  }
}

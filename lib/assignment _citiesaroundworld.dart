import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Cities(),
  ));
}

class Cities extends StatelessWidget {
  var color = [
    Colors.orange,
    Colors.orange,
    Colors.orange,
    Colors.orange,
    Colors.orange,
    Colors.orange

  ];
  var image = [
    "assets/image/indiagate.jpg",
    "assets/image/finland1.jpeg",
    "assets/image/Londan.jpeg",
    "assets/image/canada1.jpeg",
    "assets/image/usa1.jpeg",
    "assets/image/switzerland.jpeg"
  ];
  var name = ["Delhi", "Finland", "Londan", "Vancouver", "New York","Geneva"];
  var contury = ["India", "Europe", "UK", "Canada", "USA","Switzerland"];
  var pop = [32.9, 5.54, 8.8, 2.6, 3.5,8.6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Cities Around World",
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal),
          ),
        ),
        backgroundColor: Colors.orange[900],
      ),

      body: ListView.separated(

          itemBuilder: (context, index) {
            return Card(
              color: color[index],
              child: ListTile(
                leading: Image(
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  image: AssetImage(image[index]),
                ),
                title: Text(name[index],
                  style:
                  TextStyle(
                  fontSize: 19,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal
                ),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(contury[index],
                      style:
                      TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal
                      ),),
                    Text("population: ${pop[index]} million"),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 7,
              color: Colors.white,
            );
          },
          itemCount: name.length),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Assignmentcarousel(),
  ));
}

class Assignmentcarousel extends StatefulWidget {
  const Assignmentcarousel({super.key});

  @override
  State<Assignmentcarousel> createState() => _AssignmentcarouselState();
}

class _AssignmentcarouselState extends State<Assignmentcarousel> {
  var image = [
    "assets/image/veg1.jpeg",
    "assets/image/veg2.jpeg",
    "assets/image/veg3.jpeg",
    "assets/image/veg4.jpeg",
    "assets/image/veg1.jpeg",
    "assets/image/veg2.jpeg",
    "assets/image/veg3.jpeg",
    "assets/image/veg4.jpeg",
    "assets/image/veg1.jpeg",
    "assets/image/veg2.jpeg",
    "assets/image/veg3.jpeg",
    "assets/image/veg4.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            title: Text(
              "FARMERS FRESH ZONE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.green,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on_outlined,
                  size: 25,
                ),
                color: Colors.white,
              ),
              Text(
                "Kochi",
                style: TextStyle(color: Colors.white),
              ),
            ],
            bottom: AppBar(
              backgroundColor: Colors.green,
              title: Container(
                color: Colors.white,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search for vegetables and fruits...",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            expandedHeight: 115,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 25,
                        width: 125,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.green, width: 1)),
                        child: Column(
                          children: [
                            Text(
                              "VEGETABLES",
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 125,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.green, width: 1)),
                        child: Column(
                          children: [
                            Text(
                              "FRUITS",
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 125,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.green, width: 1)),
                        child: Column(
                          children: [
                            Text(
                              "EXOTIC CUTS",
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CarouselSlider(
                      items: [
                        Image(
                            image: AssetImage("assets/image/vegetables.jpeg")),
                        Image(
                            image: AssetImage("assets/image/vegetables 1.jpg")),
                        Image(
                            image: AssetImage("assets/image/vegetables2.jpeg")),
                        Image(
                            image: AssetImage("assets/image/vegetables3.jpg")),
                      ],
                      options: CarouselOptions(
                        height: 150,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        border: Border.all(
                            color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,

                        children: [
                          Column(
                            children: [
                              Icon(Icons.timer),
                              Text("30 mins policy"),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.verified_user),
                              Text("Traceability"),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.home),
                              Text("Local Sourrounding"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shop by Category",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Card(elevation: 10,shadowColor: Colors.black12,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                        child: Image(
                  image: AssetImage(image[index]),
                  fit: BoxFit.cover,
                )));
              }, childCount: image.length),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 5/3))
        ],
      ),
    );
  }
}

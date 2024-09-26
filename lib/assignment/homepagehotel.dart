import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepagehotel(),
  ));
}

class Homepagehotel extends StatefulWidget {
  const Homepagehotel({super.key});

  @override
  State<Homepagehotel> createState() => _HomepagehotelState();
}

class _HomepagehotelState extends State<Homepagehotel> {
  var image = [
    "assets/image/hotelroompic.jpeg",
    "assets/image/hotelroompic.jpeg",
    "assets/image/hotelroompic.jpeg"
  ];
  var name = [
    "Awosome Room near Boddha",
    "Awosome Room near Calicut",
    "Awosome Room near Kochi"
  ];
  var subname = ["Boddha ,Karnadaka", "Calicut,Kerala", "Kochi,Kerala"];
  var price=["40","42","50"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: Colors.lightBlue[200],
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
                color: Colors.black,
              ),
            ],
            expandedHeight: 180,
            flexibleSpace: Stack(
              children: [
                const Align(
                  child: Text(
                    "Type Your Location",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  alignment: Alignment.center,
                ),
                Positioned(
                  bottom: 8,
                  left: 16,
                  right: 16,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt_outlined),
                          color: Colors.black,
                        ),
                        hintText: "Search....",
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.search),
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.hotel_rounded,
                            color: Colors.black,
                          ),
                          Text(
                            "Hotel",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      )),
                  Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.restaurant,
                            color: Colors.black,
                          ),
                          Text(
                            "Resturent",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      )),
                  Container(
                      width: 100,
                      height: 100,
                      color: Colors.orange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.local_cafe,
                            color: Colors.black,
                          ),
                          Text(
                            "Cafe",
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          image[index],
                          height: 180,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: Container(
                            width: 40,
                            height: 25,
                            color: Colors.white,
                            child: Center(child: Text("\$ ${price[index]}", style: TextStyle(color: Colors.black),)),
                          ),
                        ),
                      ],
                    ),

                    ListTile(
                      title: Text(name[index]),
                      subtitle: Center(child: Text(subname[index])),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.green,
                        ),
                        Icon(
                          Icons.star_half,
                          color: Colors.green,
                        ),
                        SizedBox(width: 8),
                        Text('(220 reviews)'),
                      ],
                    ),
                    const Divider(
                      thickness: 10,
                      color: Colors.white,
                    ),
                  ],
                );
              },
              childCount: name.length,
            ),
          ),
        ],
      ),
    );
  }
}

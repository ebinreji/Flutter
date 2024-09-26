import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:julyfultterproject/assignment/assignment%20vegetable%20%20pg3.dart';
import 'package:julyfultterproject/assignment/assignment%20vegetables%20pg2.dart';

void main() {
  runApp(MaterialApp(
    home: vegetablespg1(),
    debugShowCheckedModeBanner: false,
    routes: {
      "product":(context)=> Assignmentpg2(),
      "product1":(context)=>Assignmentpg3()
    },
  ));
}

class vegetablespg1 extends StatefulWidget {
  const vegetablespg1({super.key});

  @override
  State<vegetablespg1> createState() => _vegetablespg1State();
}

class _vegetablespg1State extends State<vegetablespg1> {
  int index = 2;
  var image = [
    "assets/image/veg3.jpeg",
    "assets/image/Tomato.jpeg",
    "assets/image/carrot.jpeg",
    "assets/image/Potato.jpeg",
    "assets/image/Onion.jpeg",
    "assets/image/Pumpkin.jpeg",
    "assets/image/radish1.jpeg",
    "assets/image/beans.jpeg"
  ];
  var name = [
    "Cabbage",
    "Tomato",
    "Carrot",
    "Pototo",
    "Onion",
    "Pumpkin",
    "Radish",
    "Beans"
  ];
  var title = [
    "KRM Product",
    "KRM Product",
    "KRM Product",
    "KRM Product",
    "KRM Product",
    "KRM Product",
    "KRM Product",
    "KRM Product"
  ];
  var price = [
    "11.25",
    "7.90",
    "5.80",
    "12.30",
    "10.74",
    "6.21",
    "8.69",
    "4.33",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Icons.home,
              ),
              label: " ",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_none,
              ),
              label: " ",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: " ",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_outlined,
              ),
              label: " ",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: " ",
            ),
          ]),
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            floating: true,
            pinned: true,
            title: Text(
              "Store",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: 25,
                ),
                color: Colors.black,
              ),
            ],

            bottom: PreferredSize(
              preferredSize: Size.zero,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.tune),
                      color: Colors.black,
                    ),
                    hintText: "Search for products",
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      color: Colors.black,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Icon(FontAwesomeIcons.carrot, color: Colors.orange),
                  Text(
                    "vegetables",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.apple,
                    color: Colors.red,
                  ),
                  Text(
                    "Frutis",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(FontAwesomeIcons.drumstickBite, color: Colors.brown),
                  Text(
                    "Meat",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(FontAwesomeIcons.drumstickBite, color: Colors.redAccent),
                  Text(
                    "Chicken",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(FontAwesomeIcons.fish, color: Colors.blue),
                  Text(
                    "Fish",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(FontAwesomeIcons.shoppingBasket, color: Colors.black),
                  Text(
                    "Groceries",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Card(

                    child: Column(
                      children: [

                        ClipRRect(

                            borderRadius: BorderRadius.circular(12),
                            child: Image(
                              height: 140,
                              image: AssetImage(image[index]),
                              fit: BoxFit.cover,
                            ),

                        ),
                        Text(name[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Text(title[index]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$ ${price[index]}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            IconButton(onPressed: (){
                              Navigator.pushNamed(context,"product");
                            }, icon: Icon(Icons.add_box),color: Colors.green,iconSize: 30,)
                          ],
                        )
                      ],
                    ),

                );
              }, childCount: image.length),
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
        ],
      ),
    );
  }
}

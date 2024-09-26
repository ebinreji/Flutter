import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:julyfultterproject/assignment/assignment%20vegetable%20%20pg3.dart';



class Assignmentpg2 extends StatefulWidget {
  const Assignmentpg2({super.key});

  @override
  State<Assignmentpg2> createState() => _Assignmentpg2State();
}

class _Assignmentpg2State extends State<Assignmentpg2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              Container(
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage("assets/image/tomato3.jpg"),
                  height: 250,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Bangla Tomato",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("KRM Product"),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
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
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(FontAwesomeIcons.minus)),
                        Text(
                          "1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(FontAwesomeIcons.add)),
                      ],
                    ),
                  ),
                ),
                Text(
                  "\$7.90 ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                "About the product",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                  "Bangla Tomato is a variety of tomato known for its vibrant red color, juicy texture, and rich, tangy flavor. Typically smaller and rounder than other types of tomatoes, Bangla Tomatoes are commonly used in a wide range of dishes, adding a fresh and zesty element to salads, curries, and sauces. They are a popular choice in Bengali cuisine, prized for their natural sweetness and slight tartness, making them perfect for both raw consumption and cooking. Packed with vitamins and antioxidants, Bangla Tomatoes are a nutritious and flavorful ingredient in many recipes."),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite_border)),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,"product1");
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: Colors.green,
                    padding:
                        EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
                child: const Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

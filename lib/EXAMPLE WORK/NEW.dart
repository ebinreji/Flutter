import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FARMERS FRESH ZONE'),
        backgroundColor: Colors.green,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.location_on),
                Text('Kochi'),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search for vegetables and fruits..',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterChip(label: Text('VEGETABLES'), onSelected: (_) {}),
                FilterChip(label: Text('FRUITS'), onSelected: (_) {}),
                FilterChip(label: Text('EXOTIC CUTS'), onSelected: (_) {}),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('assets/your_image.png'), // Replace with your image path
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.timer),
                      Text('30 mins policy'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.verified_user),
                      Text('Traceability'),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.home),
                      Text('Local Surrounding'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Shop by Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard('Tomatoes', 'assets/tomatoes.png'), // Replace with your image paths
                  CategoryCard('Pineapples', 'assets/pineapples.png'),
                  CategoryCard('Tomatoes', 'assets/tomatoes.png'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String name;
  final String imagePath;

  CategoryCard(this.name, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(imagePath, width: 100, height: 80, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(name),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Stackassignment(),
  ));
}

class Stackassignment extends StatefulWidget {
  const Stackassignment({super.key});

  @override
  State<Stackassignment> createState() => _StackassignmentState();
}

class _StackassignmentState extends State<Stackassignment> {
  int index = 3;

  var icon = [
    Icon(Icons.person),
    Icon(Icons.dashboard),
    Icon(Icons.info),
    Icon(Icons.logout),
  ];
  var name = [" My Account", "Dashboard", "About", "Logout"];

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
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.data_usage_rounded,
              ),
              label: "Data",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Account",
            ),
          ]),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 370),
              child: Column(
                children: [
                  Text(
                    "Adam John",
                    style: TextStyle(fontSize: 30, color: Colors.blue[300]),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Card(
                          color: Colors.white70,
                          child: ListTile(
                            leading: icon[index],
                            title: Text(name[index]),
                          ),
                        ),
                      );
                    },
                    itemCount: name.length,
                  )),
                ],
              ),
            ),
          ),
          Container(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 12),
                  child: Icon(
                    Icons.list_outlined,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 16),
                  child: Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120, left: 16),
                  child: Text(
                    "Edit Your Profile",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFF577290),
            ),
            height: 270,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment(0, -0.31),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                    image: AssetImage("assets/image/canada1.jpeg"),
                    fit: BoxFit.fill),
              ),
              height: 180,
              width: 180,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Navogationdrawereg(),
  ));
}

class Navogationdrawereg extends StatefulWidget {
  const Navogationdrawereg({super.key});

  @override
  State<Navogationdrawereg> createState() => _NavogationdraweregState();
}

class _NavogationdraweregState extends State<Navogationdrawereg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white70,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Adam"),
              accountEmail: Text("Adam608@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/image/portugal.jpeg"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/image/havasu_falls.jpeg")),
              ],
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/canada1.jpeg"),
                      fit: BoxFit.fill)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("home"),
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text("Send"),
            ),
            ListTile(
              leading: Icon(Icons.update),
              title: Text("update"),
            ),
            ListTile(
              leading: Icon(Icons.drafts),
              title: Text("Draft"),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Drawer"),
      ),
    );
  }
}

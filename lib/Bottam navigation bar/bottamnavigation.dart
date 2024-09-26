import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Bottamnavigation1(),
  )
  );
}
class Bottamnavigation1 extends StatefulWidget {
  const Bottamnavigation1({super.key});

  @override
  State<Bottamnavigation1> createState() => _Bottamnavigation1State();
}

class _Bottamnavigation1State extends State<Bottamnavigation1> {
  int index=1;
  var screen=[
    Text("Profile"),
    Text("Chat"),
    Text("Call"),
    Text("Contact"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.yellow,
      title: Text("Bottam Navigation ",),
      actions: [
        Icon(Icons.search,),

        PopupMenuButton(itemBuilder: (context){
          return[
            PopupMenuItem(child: Text("Invite",style: TextStyle(color: Colors.lightBlueAccent),)),
            PopupMenuItem(child: Text("Refresh")),
            PopupMenuItem(child: Text("Logout")),
          ];
        }
        ),
      ],

    ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (tapindex){
            setState(() {
              index=tapindex;
            });
          },
          selectedItemColor:Colors.red,
          unselectedItemColor: Colors.green,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.yellow,


          items: [
        BottomNavigationBarItem(icon: Icon(Icons.person,),label: "profile",backgroundColor: Colors.yellow),
        BottomNavigationBarItem(icon: Icon(Icons.message,),label: "Chat",backgroundColor: Colors.yellow),
        BottomNavigationBarItem(icon: Icon(Icons.phone,),label: "Call",backgroundColor: Colors.yellow),
        BottomNavigationBarItem(icon: Icon(Icons.contact_page,),label: "Contact",backgroundColor: Colors.yellow),
      ]),
      body:Center(child: screen[index],),
    );
  }
}

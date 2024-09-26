import 'package:flutter/material.dart';
import 'package:julyfultterproject/Gridviewextend.dart';
import 'package:julyfultterproject/home%20page.dart';
import 'package:julyfultterproject/listcustom_delegate.dart';


class Tabbareg extends StatefulWidget {
  const Tabbareg({super.key});

  @override
  State<Tabbareg> createState() => _TabbaregState();
}

class _TabbaregState extends State<Tabbareg> {
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar:
        TabBar(
              labelColor: Colors.blue,
              dividerColor: Colors.black,
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(child:Icon(Icons.camera_alt), ),
                Tab(child: Text("chat"),),
                Tab(child: Text("Status"),),
                Tab(child: Text("Contact"),),
              ]
          ),

        body: TabBarView(children: [
          Center(child: Icon(Icons.camera_alt),),
          Listcustomdelegate(),
          Gridviewextend(),
          Homepage(),


        ]),
        floatingActionButton: FloatingActionButton(onPressed: (){},
          child: Icon(Icons.message),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,),
      ),
    );
  }
}

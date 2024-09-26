import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),));
}
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(color: Colors.white,
            child:
              ListTile(
                leading: Image(image: AssetImage("assets/image/superman.png"),),
                title: Text("Noyal",style: TextStyle(color: Colors.black),),
                subtitle: Text("9...............................",style: TextStyle(color: Colors.black),),
                trailing: Icon( Icons.call),
              )
          ),
          Card(color: Colors.white,
              child:
              ListTile(
                leading: Image(image: AssetImage("assets/image/superman.png"),),
                title: Text("Anugrah",style: TextStyle(color: Colors.black),),
                subtitle: Text("9188422060",style: TextStyle(color: Colors.black),),
                trailing: Icon( Icons.call),
              )
          ),
          Card(color: Colors.white,
              child:
              ListTile(
                leading: Image(image: AssetImage("assets/image/superman.png"),),
                title: Text("Sam",style: TextStyle(color: Colors.black),),
                subtitle: Text("9999999999",style: TextStyle(color: Colors.black),),
                trailing: Icon( Icons.call),
              )
          ),
          Card(color: Colors.white,
              child:
              ListTile(
                leading: Image(image: AssetImage("assets/image/superman.png"),),
                title: Text("Harold",style: TextStyle(color: Colors.black),),
                subtitle: Text("9000000009",style: TextStyle(color: Colors.black),),
                trailing: Icon( Icons.call),
              )
          ),
          Card(color: Colors.white,
              child:
              ListTile(
                leading: Image(image: AssetImage("assets/image/superman.png"),),
                title: Text("Aju",style: TextStyle(color: Colors.black),),
                subtitle: Text("9100000099",style: TextStyle(color: Colors.black),),
                trailing: Icon( Icons.call),
              )
          ),
          Card(color: Colors.white,
              child:
              ListTile(
                leading: Image(image: AssetImage("assets/image/superman.png"),),
                title: Text("Amal",style: TextStyle(color: Colors.black),),
                subtitle: Text("9111111199",style: TextStyle(color: Colors.black),),
                trailing: Icon( Icons.call),
              )
          ),
          Card(color: Colors.white,
              child:
              ListTile(
                leading: Image(image: AssetImage("assets/image/superman.png"),),
                title: Text("Hari kuttan ",style: TextStyle(color: Colors.black),),
                subtitle: Text("922222299",style: TextStyle(color: Colors.black),),
                trailing: Icon( Icons.call),
              )
          ),
        ],
      ),
    );
  }
}

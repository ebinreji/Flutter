import 'package:flutter/material.dart';
import 'package:julyfultterproject/datapassing/datastore1.dart';
import 'package:julyfultterproject/datapassing/screen2.dart';
void main(){
  runApp(MaterialApp(home: Screen1(),debugShowCheckedModeBanner: false,
  routes: {
    "screen2":(context)=>Screen2()
  },));
}
class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, ),
          children: datastore1.map((product) =>
              GestureDetector(
                child: Column(
                  children: [
                    Center(child: Image(image: AssetImage(product["image"]),height: 250,width: 250,)),
                    Text(product["name"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ],
                ),
                onTap: () => getproduct(context, product["id"]),)).toList(),
        )
    );
  }
  void getproduct(BuildContext context,product){
    Navigator.pushNamed(context, "screen2",arguments: product);
  }
}

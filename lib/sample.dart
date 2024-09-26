import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Sample(),
  ));
}

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("welcome"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/image/background.jpg"),
              fit: BoxFit.fill),
        ),
        height: double.infinity,
        width: double.infinity,
        //     gradient: LinearGradient(
        // colors:
        // [
        //   Colors.yellow,
        //   Colors.green,
        //   Colors.blue,
        //   Colors.red,
        // ],
        //   begin: Alignment.topRight,
        //   end: Alignment.bottomLeft,

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Icon(Icons.account_balance,size: 25,color: Colors.red,),
              Image(
                image: AssetImage("assets/image/superman.png"),
                height: 50,
                width: 50,
              ),
              const Text(
                "ranga annan",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

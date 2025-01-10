import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Atmcard(),
    debugShowCheckedModeBanner: false,
  ));
}

class Atmcard extends StatefulWidget {
  const Atmcard({super.key});

  @override
  State<Atmcard> createState() => _AtmcardState();
}

class _AtmcardState extends State<Atmcard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDA6162),
      body: Center(
        child: Container(
          height: 300,
          width: 700,
          decoration: BoxDecoration(
              image:DecorationImage(
                image: AssetImage("assets/image/Atmbackground.jpg"),fit: BoxFit.cover ,
              ),
              borderRadius: BorderRadius.circular(30)),
          child: Stack(
            children: [
              Positioned(
                  left: 270,
                  top: -80,
                  child: Image(
                    image: AssetImage("assets/image/atm_logo.png"),
                    height: 250,
                  )),
              Positioned(
                  left: 25,
                  top: 40,
                  child: Image(
                    image: AssetImage("assets/image/atm_chip.png"),
                    height: 115,
                    width: 115,
                  )),
              Positioned(
                  left: 350,
                  top: 50,
                  child: Image(
                    image: AssetImage("assets/image/atm_contactless.png"),
                    height: 95,
                    width: 95,
                    color: Colors.white,
                  )),

              Positioned(
                  left: 130,
                  top: 140,
                  child: Text(
                    "6522 32100 2345 9876",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              Positioned(
                top: 180,
                left: 160,
                child: Row(
                  children: [
                    Text(
                      "Vaild \n date",
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "08/23",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 236,
                  left: 30,
                  child: Text(
                    "VINAYAK HEGDE",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              Positioned(
                  top: 230,
                  left: 390,
                  child: Image(
                    image: AssetImage("assets/image/atm_visa1.png"),
                    height: 50,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

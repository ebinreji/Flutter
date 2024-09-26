import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Carousaleg(),
  ));
}

class Carousaleg extends StatefulWidget {
  const Carousaleg({super.key});

  @override
  State<Carousaleg> createState() => _CarousalegState();
}

class _CarousalegState extends State<Carousaleg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CarouselSlider(
            items: [
              Image(image: AssetImage("assets/image/indiagate.jpg")),
              Image(image: AssetImage("assets/image/switzerland.jpeg")),
              Image(image: AssetImage("assets/image/Londan.jpeg")),
              Image(image: AssetImage("assets/image/nature.jpeg")),
              Image(image: AssetImage("assets/image/finland1.jpeg")),
            ],
            options: CarouselOptions(
              height: 150,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            )),
      ),
    );
  }
}

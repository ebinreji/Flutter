import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Tweenanimation(),
    debugShowCheckedModeBanner: false,
  ));
}

class Tweenanimation extends StatefulWidget {
  const Tweenanimation({super.key});

  @override
  State<Tweenanimation> createState() => _TweenanimationState();
}

class _TweenanimationState extends State<Tweenanimation> {
  double custumOpacity =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              TweenAnimationBuilder(onEnd: (){
                setState(() {
                  custumOpacity = 1;
                });
              },
                curve: Curves.bounceOut,
                duration: Duration(seconds: 2),
                tween: Tween<double>(begin: 30, end: 100),
                builder: (BuildContext context, dynamic value,child) {
                  return Icon(
                    Icons.flash_on,
                    color: Colors.red,
                    size: value,
                  );
                },
              ),
              AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: custumOpacity,
                  child: Text(
                    "Flash",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

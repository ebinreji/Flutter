import 'package:flutter/material.dart';

class Customgridwidget extends StatelessWidget{
  final Image img;
  final Text text;
  final Color clr;
  Customgridwidget({ required this.img,required this.text,required this.clr,});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Card(color: clr,
          child: Column(
            children: [
              Container(child:text ,),
              Container(child: img,height: 50,width: 50,),


            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Customwidget extends StatelessWidget {
  final Image img;
  final Text title;
  final Text? subtitle;
  final Icon? icons;
  VoidCallback onpress;

  Customwidget(
      {required this.img, required this.title,  this.subtitle, required this.onpress,  this.icons});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(child: Column(
        children: [
          ListTile(
            leading: img,
            title: title,
            subtitle: subtitle,
            trailing: icons,
            onTap: onpress,
          ),
          Container(child: img,)
        ],
      ),

      ),

    );
  }
}

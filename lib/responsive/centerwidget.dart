import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:julyfultterproject/responsive/responsive.dart';
import 'package:julyfultterproject/responsive/rightwidget.dart';

class Centerwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(20),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  color: Colors.yellow,
                );
              },
              itemCount: 15,
            ),
            if (Responsive.isMobile(context)) Rightwidget()

          ],
        ),
      ),
    );
  }
}

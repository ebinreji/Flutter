import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:julyfultterproject/responsive/responsive.dart';

class Rightwidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  return Container(
    width: double.infinity,
    height:Responsive.isWeb(context) ? double.infinity:600,
    color: Colors.red[100],
    child: Text("DATA"),
  );
  }
}

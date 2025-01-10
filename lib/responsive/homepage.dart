import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:julyfultterproject/responsive/centerwidget.dart';
import 'package:julyfultterproject/responsive/leftwidget.dart';
import 'package:julyfultterproject/responsive/responsive.dart';
import 'package:julyfultterproject/responsive/rightwidget.dart';
void main(){
  runApp(MaterialApp(home: homepage(),
  debugShowCheckedModeBanner: false,));
}
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !Responsive.isWeb(context)?AppBar(title: Text("HOME PAGE"),
      actions: [
        if(!Responsive.isWeb(context))IconButton(onPressed: (){
          if(MediaQuery.of(context).orientation==Orientation.portrait){
            SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
          }
          else{
            SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          }
        }, icon: Icon(Icons.arrow_circle_down))
      ],):null,
      
      drawer: leftwidget(),
      body: Row(
        children: [
          if(Responsive.isWeb(context))
          Expanded(child: leftwidget(),flex: 2,),
          Expanded(child: Centerwidget(),flex: 5,),
          if(Responsive.isWeb(context))
          Expanded(child: Rightwidget(),flex: 3,),
        ],
      ),
    );
  }
}

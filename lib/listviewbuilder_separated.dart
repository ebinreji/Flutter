import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Listviewbuilderseparated(),));
}
class Listviewbuilderseparated extends StatelessWidget {
  var name=["anu","ann","john","jo","unni"];
  var color=[Colors.red,Colors.blue,Colors.deepOrangeAccent,Colors.red,Colors.blue];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List operator"),
       backgroundColor: Colors.blue,
      ),
      body:ListView.separated(itemBuilder:(context,index){
        return Card(color: color[index],
        child: ListTile(
          title: Text(name[index]),
        ),
        );
      },
     separatorBuilder: (context,index){
        return Divider(
          thickness: 5,
          color: Colors.lime,
        );

     },
      itemCount: name.length) ,
    );
  }
}

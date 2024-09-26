import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Listbuilder(),));
}
class Listbuilder extends StatelessWidget {
  var name=["Facebook","A10 Networks INC","Intel Corp","HP inc","Advance Micro devices inc",
            "Apple Inc","Amazone.Inc","Microsoft Corparation","Facebook"];
  var icon=["F","A","I","H","A","A","A","M","F"];
  var values=["455","5648","647","987","1234","6786","456","324","635"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Builder"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Card(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.blue,
            child: Text(icon[index]),),
            title: Text(name[index]),
            trailing: Text("\$ ${values[index]}"),
          ),
        );
      },
        itemCount: name.length,
      ),
    );
  }
}

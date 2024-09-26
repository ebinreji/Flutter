import 'package:flutter/material.dart';
void main(){

  runApp(MaterialApp
    (
    debugShowCheckedModeBanner: false,
    home: ListviewSeparetedAssignment(),));
}
class ListviewSeparetedAssignment extends StatelessWidget {
 var name=["List item 0","List item 1","List item 2","List item 3","List item 4","List item 5",
   "List item 6","List item 7","List item 8","List item 9","List item 10","List item 11","List item 12",
   "List item 13","List item 14","List item 15","List item 16","List item 17","List item 18","List item 19",
 ];
 var saperator=["Separator 1","Separator 2","Separator 3","Separator 4","Separator 5","Separator 6","Separator 7",
   "Separator 8","Separator 9","Separator 10","Separator 11","Separator 12","Separator 13","Separator 14","Separator 15",
   "Separator 16","Separator 17","Separator 18","Separator 19",
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listview.separated()"),
      backgroundColor: Colors.green,
      ),
      body:ListView.separated(itemBuilder:(context,index){
        return Card(color:Colors.white,
          child: ListTile(
            title: Text(name[index]),
          ),
        );
      },
          separatorBuilder: (context,index){
            return Card(color:Colors.grey,
              child: ListTile(
                title: Text(saperator[index]),
              ),
            );

          },
          itemCount: name.length) ,
    );
  }
}

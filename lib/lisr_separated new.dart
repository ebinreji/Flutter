import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: ListseparatedNew(),));
}
class ListseparatedNew extends StatelessWidget {

var month=["Jan","Feb","Mar","April","May","June","July","Aug","Sep","Oct","Nov","Dec"];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title:Text("List separated"),
      backgroundColor: Colors.blue,
      ),
      body: ListView.separated(itemBuilder: (context,index)
      {
        return Card(
          child: Text(month[index]),
        );
      },
          separatorBuilder: (context,index)
          {
       if(index %3==0){
         return Card(
           child: Container(
             color: Colors.red,
             child: Text("Advertisment"),
           ),
         );
       }
       else{
         return SizedBox();
       }
          },
          itemCount:month.length ),
    );
  }
}

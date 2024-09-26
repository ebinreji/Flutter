import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Listcustomdelegate(),));
}
class Listcustomdelegate extends StatelessWidget {
  var name=["amal","Rahul","Noyal","Hari","ebi"];
  var phone=["9961148414","9188422099","9188422000","9188777799","9188987699"];
  var image=["assets/image/Grey.jpg","assets/image/background.jpg","assets/image/Grey.jpg",
    "assets/image/background.jpg","assets/image/Grey.jpg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.custom(childrenDelegate: SliverChildListDelegate(

        List.generate(name.length, (index){
          return Card(
            child: ListTile(
              leading: CircleAvatar(backgroundImage: AssetImage(image[index]),),
              title:Text(name[index]) ,
              subtitle: Text(phone[index]),
            ),
          );
    })
      )),
    );
  }
}

import 'package:flutter/material.dart';

class Listbuilder extends StatelessWidget {
  var name=["amal","Rahul","Noyal","Hari","ebi"];
  var phone=["9961148414","9188422099","9188422000","9188777799","9188987699"];
  var image=["assets/image/Grey.jpg","assets/image/background.jpg","assets/image/Grey.jpg","assets/image/background.jpg","assets/image/Grey.jpg"];
var color=[Colors.white,Colors.white,Colors.white,Colors.white,Colors.white];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue,
      body: ListView.builder(itemBuilder: (context,index){
        return Card(
          color: color[index],
          child: ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(image[index])),
          title: Text(name[index]),
          subtitle:Text(phone[index]),
          trailing: Icon(Icons.call),
        ),);
      },
        itemCount: name.length,
      ),
    );
  }
}

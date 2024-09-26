import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Listviewcustm(),));
}
class Listviewcustm extends StatelessWidget {
  var name=["amal","Rahul","Noyal","Hari","ebi"];
  var phone=["9961148414","9188422099","9188422000","9188777799","9188987699"];
  var image=["assets/image/Grey.jpg","assets/image/background.jpg","assets/image/Grey.jpg",
    "assets/image/background.jpg","assets/image/Grey.jpg"];
  var color=[Colors.white,Colors.white,Colors.white,Colors.white,Colors.white];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List"),
      backgroundColor: Colors.blue,),
      body: ListView.custom(childrenDelegate:SliverChildBuilderDelegate((context,index){
        return Card(
          child: ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage(image[index]),),
            title: Text(name[index]),
            subtitle: Text(phone[index]),
            trailing:Wrap(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 8,),
                Icon(Icons.delete),
              ],
            )
          ),
        );},
        childCount: name.length,
      ),

      ),
    );
  }
}

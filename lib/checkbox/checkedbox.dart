import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Checkedbox(),));
}

class Checkedbox extends StatefulWidget {
  const Checkedbox({super.key});

  @override
  State<Checkedbox> createState() => _CheckedboxState();
}

class _CheckedboxState extends State<Checkedbox> {
  bool ischecked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: Row(
          children: [
            Checkbox(checkColor: Colors.green,
                activeColor: Colors.red,
                value: ischecked, onChanged: (bool ? value){
              setState(() {
                ischecked=value!;
              });
            },
            ),
            Text("male"),
          ],
        ),

      ),

    );
  }
}

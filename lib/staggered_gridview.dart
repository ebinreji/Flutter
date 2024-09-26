import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: staggered(),));
}
class staggered extends StatefulWidget {
  const staggered({super.key});

  @override
  State<staggered> createState() => _staggeredState();
}

class _staggeredState extends State<staggered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: StaggeredGrid.count(crossAxisCount: 6,mainAxisSpacing: 10,crossAxisSpacing: 10,
        children: [
          StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 2,
              child: Container(color: Colors.red,
              child: Text("1"),
              )),
          StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 3,
              child: Container(color: Colors.blue,
                child: Text("2"),
              )),
          StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 2,
              child: Container(color: Colors.grey,
                child: Text("3"),
              )),
          StaggeredGridTile.count(crossAxisCellCount: 1, mainAxisCellCount: 1,
              child: Container(color: Colors.brown,
                child: Text("4"),
              )),
          StaggeredGridTile.count(crossAxisCellCount: 3, mainAxisCellCount: 3,
              child: Container(color: Colors.red,
                child: Text("5"),
              )),
          StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 5,
              child: Container(color: Colors.blue,
                child: Text("6"),
              )),
          StaggeredGridTile.count(crossAxisCellCount: 2, mainAxisCellCount: 4,
              child: Container(color: Colors.brown,
                child: Text("7"),
              )),
          StaggeredGridTile.count(crossAxisCellCount: 3, mainAxisCellCount: 5,
              child: Container(color: Colors.black,
                child: Text("8"),
              )),
        ],),
      ),

    );
  }
}

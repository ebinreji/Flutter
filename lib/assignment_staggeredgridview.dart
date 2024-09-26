import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main(){
  runApp(
      MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Staggeredassignment(),
  )
  );
}
class Staggeredassignment extends StatefulWidget {
  const Staggeredassignment({super.key});

  @override
  State<Staggeredassignment> createState() => _StaggeredassignmentState();
}

class _StaggeredassignmentState extends State<Staggeredassignment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StaggeredRecyclerView"),
        backgroundColor: Colors.blue[600],
      ),
      backgroundColor: Colors.grey[400],
      body: SingleChildScrollView(
        child: StaggeredGrid.count(crossAxisCount: 2,
        mainAxisSpacing: 4,
            crossAxisSpacing: 4,
children: [
  StaggeredGridTile.count(crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Card(
        child:SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:Image.asset("assets/image/havasu_falls.jpeg",fit: BoxFit.fill,width: 250,height: 200,)
              ),
              Text("Havasu Falls",style:TextStyle(fontSize: 17,
              fontWeight: FontWeight.w300) ,
              ),
            ],
          ),
        ),
      )),
  StaggeredGridTile.count(crossAxisCellCount: 1,
      mainAxisCellCount: 2,
      child: Card(
        color: Colors.white,
        child:SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/image/trondheim.jpeg",fit: BoxFit.fill,width: 250,height: 440,)
              ),
              Text("Trondheim",style:TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w300) ,textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      )),
  StaggeredGridTile.count(crossAxisCellCount: 1,
      mainAxisCellCount: 2,
      child: Card(
        color: Colors.white,
        child:SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/image/portugal.jpeg",fit: BoxFit.fill,width: 250,height: 440,)
              ),
              Text("Portugal",style:TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w300) ,textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      )),
  StaggeredGridTile.count(crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Card(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/image/rocky mountain national park.jpeg",fit: BoxFit.fill,width: 250,height: 150,)
              ),
              Text("Rocky Mountain National Park",style:TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w300) ,textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      )),
  StaggeredGridTile.count(crossAxisCellCount: 1,
      mainAxisCellCount: 2,
      child: Card(
        color: Colors.white,

        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/image/nature.jpeg",fit: BoxFit.fill,width: 250,height: 440,)
              ),
              Text("Oceania",style:TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w300) ,textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      )),
  StaggeredGridTile.count(crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: Card(
        color: Colors.white,

        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/image/oceania.jpeg",fit: BoxFit.fill,width: 250,height: 190,)
              ),
              Text("Nature",style:TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w300) ,textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ))
],
        ),
      ),
    );
  }
}

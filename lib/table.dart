import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: Table(),));
}

class Table extends StatefulWidget {
  const Table({super.key});

  @override
  State<Table> createState() => _TableState();
}

class _TableState extends State<Table> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DataTable(border: TableBorder.all(width: 1.0,color: Colors.black),
            columns:[
          DataColumn(label: Text("Id",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          DataColumn(label: Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          DataColumn(label: Text("Job",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          DataColumn(label: Text("Salary",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        ] ,
            rows: [
              DataRow(cells: [
                DataCell(Text("1")),
                DataCell(Text("Jo")),
                DataCell(Text("IT")),
                DataCell(Text("25000")),
              ]),
              DataRow(cells: [
                DataCell(Text("2")),
                DataCell(Text("Jomon")),
                DataCell(Text("IT")),
                DataCell(Text("20000")),
              ]),
              DataRow(cells: [
                DataCell(Text("3")),
                DataCell(Text("Roy")),
                DataCell(Text("IT")),
                DataCell(Text("26000")),
              ]),
              DataRow(cells: [
                DataCell(Text("4")),
                DataCell(Text("Ann")),
                DataCell(Text("IT")),
                DataCell(Text("22000")),
              ]),
              DataRow(cells: [
                DataCell(Text("5")),
                DataCell(Text("Siya")),
                DataCell(Text("IT")),
                DataCell(Text("24000")),
              ]),
            ]),
      ),
    );
  }
}

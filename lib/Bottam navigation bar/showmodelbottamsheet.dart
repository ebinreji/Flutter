import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Bottamsheet(),
  ));
}

class Bottamsheet extends StatefulWidget {
  const Bottamsheet({super.key});

  @override
  State<Bottamsheet> createState() => _BottamsheetState();
}

class _BottamsheetState extends State<Bottamsheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text("show"),
          onTap: () => show(context),
        ),
      ),
    );
  }

  show(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView(
            children: [
              ListTile(
                title: Text("data 1"),
                subtitle: Text("data 2"),
              ),
              ListTile(
                title: Text("data 11"),
                subtitle: Text("data 22"),
              ),
              ListTile(
                title: Text("data 111"),
                subtitle: Text("data 222"),
              ),
            ],
          );
        });
  }
}

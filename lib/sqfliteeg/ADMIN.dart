import 'package:flutter/material.dart';
import 'package:julyfultterproject/SQFLITE%20EXAMPLE%20WORK/examplesqflitehelper.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: admpg(),));
}
class admpg extends StatefulWidget {
  const admpg({super.key});

  @override
  State<admpg> createState() => _admpgState();
}

class _admpgState extends State<admpg> {
  List<Map<String, dynamic>> noteFromDb = [];
  bool isLoading =true;

  @override
  void initState() {
    super.initState();
    refreshData();
  }
  void refreshData() async {
    final data = await SQLHelper.readNotes();
    setState(() {
      noteFromDb = data;
      isLoading = false;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("ADMIN REPORTS"),),
      resizeToAvoidBottomInset: false,
      body: isLoading
          ?  const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('${noteFromDb[index]['name']}'),
              subtitle: Text('${noteFromDb[index]['email']}'),
              trailing: SizedBox(
                child: Wrap(
                  children: [


                  ],
                ),
              ),
            ),
          );
        },
        itemCount: noteFromDb.length,
      ),
    );
  }
}

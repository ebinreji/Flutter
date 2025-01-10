import 'package:flutter/material.dart';
import 'sqflitehelper.dart';

void main() => runApp(MaterialApp(
  home: MainPage(),
));

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> noteFromDb = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    refreshData();
  }

  void refreshData() async {
    final data = await SqfLiteHelper.readNotes();
    setState(() {
      noteFromDb = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isLoading
          ?  const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('${noteFromDb[index]['title']}'),
              subtitle: Text('${noteFromDb[index]['subtitle']}'),
              trailing: SizedBox(
                child: Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          showForm(noteFromDb[index]['id']);
                        }, icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          deleteNote(noteFromDb[index]['id']);
                        }, icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: noteFromDb.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(null),
        child: const Text('Add new'),
      ),
    );
  }
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();

  void showForm(int? id) async {
    if(id != null) {
      final existing_data = noteFromDb.firstWhere((note) => note['id'] == id);
      title.text = existing_data['title'];
      subtitle.text = existing_data['subtitle'];
    }

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(

            padding: EdgeInsets.only(
              top: 10,left: 10,right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: title,
                  decoration: InputDecoration(
                      hintText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                TextField(
                  controller: subtitle,
                  decoration: InputDecoration(
                      hintText: 'Subtitle',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (id == null) {
                        await addNote();
                      } else {  /// Change to if(id != null) --> if encountering error.
                        await updateNote(id);
                      }
                      title.text = '';
                      subtitle.text = '';
                      Navigator.pop(context);
                    },
                    child: Text(id == null ? 'Add' : 'Update')),
              ],
            ),
          );
        });
  }

  Future<void> addNote() async {
    await SqfLiteHelper.createNotes(title.text, subtitle.text);
    refreshData();
  }

  Future updateNote(int id) async {
    await SqfLiteHelper.updateNotes(id, title.text, subtitle.text);
    refreshData();
  }


  void deleteNote(int id) async {
    await SqfLiteHelper.deleteNote(id);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Deleted!')));
    refreshData();
  }
}


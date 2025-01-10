import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("task_box");

  runApp(MaterialApp(
    home: MainpgHive(),debugShowCheckedModeBanner: false,
  ));
}

class MainpgHive extends StatefulWidget {
  const MainpgHive({super.key});

  @override
  State<MainpgHive> createState() => _MainpgHiveState();
}

class _MainpgHiveState extends State<MainpgHive> {
  List<Map<String, dynamic>> task = [];
  final tbox = Hive.box('task_box');
  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTask();
  }

  Future<void> createTask(Map<String, dynamic> task) async {
    await tbox.add(task);
    loadTask();
  }

  void loadTask() {
    final data = tbox.keys.map((id) {
      final value = tbox.get(id);
      return {'key': id, 'name': value['name'], 'details': value['details']};
    }).toList();
    setState(() {
      task = data.reversed.toList();
    });
  }

  Future<void> updateTask(int key, Map<String, dynamic> uptask) async {
    await tbox.put(key, uptask);
    loadTask();
  }

  Future<void> deleteTask(int key) async {
    await tbox.delete(key);
    loadTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(color: Colors.white,
            child: ListTile(
              title: Text(task[index]['name']),
              subtitle: Text(task[index]['details']),
              trailing: SizedBox(
                child: Wrap(
                  children: [
                    IconButton(
                      onPressed: () {
                        showForm(task[index]['key']);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        deleteTask(task[index]['key']);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: task.length,
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: Color(0xFF42A5F9),
        onPressed: () {
          showForm(null);
        },
        child: Text('Add new',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
    );
  }

  void showForm(int? id) {
    if (id != null) {
      final existingTask = task.firstWhere((element) => element['key'] == id);
      nameController.text = existingTask['name'];
      detailsController.text = existingTask['details'];
    } else {
      nameController.clear();
      detailsController.clear();
    }

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Task Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: detailsController,
                decoration: InputDecoration(
                  hintText: 'Task Details',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    createTask({
                      'name': nameController.text,
                      'details': detailsController.text,
                    });
                  } else {
                    updateTask(id, {
                      'name': nameController.text,
                      'details': detailsController.text,
                    });
                  }
                  nameController.clear();
                  detailsController.clear();
                  Navigator.of(context).pop();
                },
                child: Text(id == null ? "Create Task" : "Update Task"),
              ),
            ],
          ),
        );
      },
    );
  }
}

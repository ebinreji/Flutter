import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqfLiteHelper {
  static Future<sql.Database> myData() async {
    return sql.openDatabase(
      'MyData.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTable(database);
      },
    );
  }
  static Future<void> createTable(sql.Database database) async {
    return await database.execute('''
    CREATE TABLE Notes(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      subtitle TEXT,
    )
    ''');
  }
  static Future<int> createNotes(String title, String subtitle) async {
    final db = await SqfLiteHelper.myData();
    final data = {'title': title, 'subtitle': subtitle};
    final id = await db.insert('Notes', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
  static Future<List<Map<String, dynamic>>> readNotes() async {
    final db = await SqfLiteHelper.myData();
    return db.query('Notes', orderBy: 'id');
  }
  static Future<int> updateNotes(
      int id, String newTitle, String newSubtitle) async {
    final db = await SqfLiteHelper.myData();
    final newData = {
      'title': newTitle,
      'subtitle': newSubtitle,
      'createdAt': DateTime.now().toString(),
    };
    final result =
        await db.update('Notes', newData, where: 'id=?', whereArgs: [id]);
    return result;
  }
  static Future<void> deleteNote(int id) async {
    final db = await SqfLiteHelper.myData();
    try {
      await db.delete("Notes", where: 'id=?', whereArgs: [id]);
    } catch (err) {
      debugPrint("\nSomething went wrong!\n");
    }
  }
}

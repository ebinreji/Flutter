import 'package:sqflite/sqflite.dart' as sql;
class Sqfhelper {
  static Future<sql.Database> userData() async {
    return sql.openDatabase(
      'Mydata.db',
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
        name TEXT,
        address TEXT,
        email TEXT,
        password TEXT
      )
    ''');
  }

  static Future<int?> createNotes(String name, String address, String email, String password) async {
    final db = await Sqfhelper.userData();

    var existingUser = await findUser(email);
    if (existingUser.isNotEmpty) {
      // User already exists, handle accordingly (return null or throw an exception)
      return null;
    }

    final data = {'name': name, 'address': address, 'email': email, 'password': password};
    final id = await db.insert('Notes', data);
    return id;
  }

  static Future<List<Map<String, dynamic>>> findUser(String email) async {
    final db = await Sqfhelper.userData();
    List<Map<String, dynamic>> result = await db.rawQuery('SELECT * FROM Notes WHERE email = ?', [email]);

    return result;
  }

  static Future<List<Map>> validateLogin(String email, String password) async {
    final db = await Sqfhelper.userData();

    List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT * FROM Notes WHERE email = ? AND password = ?',
        [email, password]
    );

    return result; // User exists or invalid login
  }
  static Future<List<Map<String, dynamic>>> readNotes() async {
    final db = await Sqfhelper.userData();
    return db.query('Notes', orderBy: 'id');
  }
}

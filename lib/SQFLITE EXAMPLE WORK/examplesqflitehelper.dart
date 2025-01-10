import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<sql.Database> userDatabase() async {
    return sql.openDatabase(
      'Data.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTable(database);
      },
    );
  }

  static Future<void> createTable(sql.Database database) async {
    return await database.execute('''
    CREATE TABLE UserDetails(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      email TEXT,
      password TEXT
    )
    ''');
  }

  static Future<List<Map<String, dynamic>>> findUser(String email) async {
    final db = await SQLHelper.userDatabase();
    List<Map<String, dynamic>> result =
    await db.rawQuery('SELECT * FROM UserDetails WHERE email = ?', [email]);

    if (result.isNotEmpty) {
      return result;
    }
    return result;
  }

  static Future<List<Map>> validateLogin(String email, String password) async {
    final db = await SQLHelper.userDatabase();

    /// User Case:
    List<Map<String, dynamic>> result = await db.rawQuery(
        'SELECT * FROM UserDetails WHERE email = ? AND password = ?',
        [email, password] // Parameters
    );

    if (result.isNotEmpty) {
      return result; // User exists
    }

    /// Other case:
    return result; // Invalid login
  }


  static Future<int?> createNewUser(
      String email, String password, String name) async {
    final db = await SQLHelper.userDatabase();

    var existingUser = await findUser(email);
    if (existingUser.isNotEmpty) {
      return null;
    }

    final data = {'email': email, 'password': password, 'name': name};
    final id = await db.insert('UserDetails', data);
    return id;
  }
  static Future<List<Map<String, dynamic>>> readNotes() async {
    final db = await SQLHelper.userDatabase();
    return db.query('UserDetails', orderBy: 'id');
  }

// static Future<List<Map<String, dynamic>>> getUserData() async {
//   final db = await SQLHelper.userDatabase();
//   String sql = "SELECT * FROM UserDetails";
//   return db.rawQuery(sql);
// }
}

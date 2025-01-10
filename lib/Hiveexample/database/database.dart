import 'package:hive/hive.dart';
import 'package:julyfultterproject/Hiveexample/model/usermodel.dart';

class DBfunction{
  DBfunction.internal();
  static DBfunction instance =DBfunction.internal();
  factory DBfunction(){
    return instance;
  }
  Future<void>userSignUp(User user)async{
    final db= await Hive.openBox<User>('user');
    db.put(user.id,user);
  }
  Future<List<User>>getUser()async{
    final db =await Hive.openBox<User>("user");
    return db.values.toList();
  }
}
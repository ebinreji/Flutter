import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:julyfultterproject/Hiveexample/database/database.dart';
import 'package:julyfultterproject/Hiveexample/screen/homepg.dart';
import 'package:julyfultterproject/Hiveexample/screen/regpg.dart';
import '../model/usermodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('User');
  runApp(GetMaterialApp(
    home: Lgpg(),
    debugShowCheckedModeBanner: false,
  ));
}

class Lgpg extends StatefulWidget {
  const Lgpg({super.key});

  @override
  State<Lgpg> createState() => _LgpgState();
}

class _LgpgState extends State<Lgpg> {
  bool hidePass = true;
  bool userFound = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white54,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 200),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 220, left: 20, right: 20),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextFormField(
                  controller: password,
                  obscureText: hidePass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePass = !hidePass;
                        });
                      },
                      icon: Icon(
                        hidePass ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white70,
                      foregroundColor: Colors.black87),
                  onPressed: () async {
                    final userList = await DBfunction.instance.getUser();
                    // print(userList);
                    findUser(userList);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 125),
                child: TextButton(
                  onPressed: () {
                    Get.to(Rgpg());
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white70,
                      foregroundColor: Colors.black87),
                  child: const Text("Create an account"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> findUser(List<User> userList) async {
    bool userFound = false;
    final em = email.text.trim();
    final pw = password.text.trim();

    final validate = await validateLogin(em, pw);

    if (validate == true) {
      await Future.forEach(userList, (user) {
        if (user.email == em && user.password == pw) {
          userFound = true;
          return 0;
        }
      });
      if (userFound == true) {
        Get.offAll(() => Home3(email: em));
        Get.snackbar('Success', 'Login Success!',
            backgroundColor: Colors.green);
      } else {
        Get.snackbar('Error', 'Incorrect email/password',
            backgroundColor: Colors.red);
      }
    }
  }

  Future<bool> validateLogin(String email, String password) async {
    if (email != '' && password != '') {
      return true;
    } else {
      Get.snackbar('Error', 'Fields cannot be empty');
      return false;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:julyfultterproject/sqfliteeg/Bottamsheet.dart';
import 'package:julyfultterproject/sqfliteeg/profilepg.dart';
import 'package:julyfultterproject/sqfliteeg/registrationpg.dart';
import 'package:julyfultterproject/sqfliteeg/sqfliteeg.dart';


class Lgpg1 extends StatefulWidget {
  const Lgpg1({super.key});

  @override
  State<Lgpg1> createState() => _Lgpg1State();
}

class _Lgpg1State extends State<Lgpg1> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool showpass = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<List<Map>> validateLogin(String email, String password) async {
    List<Map> data = await Sqfhelper.validateLogin(email, password);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 80),
                child: Text(
                  "Login Page",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  controller: email,  // Set email controller
                  decoration: InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.person_2),
                  ),
                  validator: (username) {
                    if (username == null ||
                        username.isEmpty ||
                        !username.contains('@gmail') ||
                        !username.contains('.com')) {
                      return "Enter a valid email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  controller: password,  // Set password controller
                  obscureText: showpass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(showpass ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                    ),
                  ),
                  validator: (password) {
                    if (password == null || password.isEmpty || password.length < 6) {
                      return "Enter a valid password";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  if (formkey.currentState!.validate()) {  // Check form validation
                    List<Map> result =
                    await validateLogin(email.text, password.text);
                    if (result.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login Success!')),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Homepg(data: result)),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Not registered!')),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Profilepg(data1: result)),
                      );
                    }
                  }
                },
                child: Text("Login"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegPage()),
                    );
                  },
                  child: Text("Not a user? Create an account!"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:julyfultterproject/Hiveeg/HOMEpg.dart';
import 'package:julyfultterproject/Hiveeg/REGpg.dart';

class LGpg extends StatefulWidget {
  const LGpg({super.key});

  @override
  State<LGpg> createState() => _LGpgState();
}

class _LGpgState extends State<LGpg> {
  final GlobalKey<FormState> formkey = GlobalKey();
  bool showpass = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    var box = Hive.box('add_box');
    String username = emailController.text;
    String password = passwordController.text;

    if (box.containsKey(username)) {
      var storedPassword = box.get(username);
      if (storedPassword == password) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home2(username: username,),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Incorrect password")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User not found")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
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
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (username) {
                    if (username!.isEmpty ||
                        !username.contains('@gmail') ||
                        !username.endsWith('.com')) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: showpass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(
                        showpass ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          showpass = !showpass;
                        });
                      },
                    ),
                  ),
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return "Enter a valid password";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    loginUser();
                  }
                },
                child: Text("Login"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => REGpg()),
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

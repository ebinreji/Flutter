import 'package:flutter/material.dart';
import 'package:julyfultterproject/SQFLITE%20EXAMPLE%20WORK/adminpage.dart';
import 'package:julyfultterproject/SQFLITE%20EXAMPLE%20WORK/Registrationpage.dart';
import 'package:julyfultterproject/SQFLITE%20EXAMPLE%20WORK/UserHomepage.dart';
import 'package:julyfultterproject/SQFLITE%20EXAMPLE%20WORK/examplesqflitehelper.dart';

class Loginpage1 extends StatefulWidget {
  @override
  State<Loginpage1> createState() => _Loginpage1State();
}

class _Loginpage1State extends State<Loginpage1> {
  bool showPass = true;

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  Future<List<Map>> validateLogin(String email, String password) async {
    List<Map> data = await SQLHelper.validateLogin(email, password);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white54,
        child: Form(
          key: formKey,
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
                  validator: (email) {
                    if (email!.isEmpty) {
                      return "Enter a valid e-mail";
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                        .hasMatch(email)) {
                      return 'Enter a valid e-mail address';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextFormField(
                    controller: password,
                    obscureText: showPass,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                        icon: Icon(
                          showPass == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (password1) {
                      if (password1!.isEmpty) {
                        return "Enter a valid password";
                      } else if (password1.length < 6) {
                        return "Password must have least 6 characters";
                      } else {
                        return null;
                      }
                    }),
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
                    var valid = formKey.currentState!.validate();
                    if (valid) {
                      if (email.text == 'admin@gmail.com' &&
                          password.text == 'admin@123') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Welcome Admin!')),
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  Adminpg()));
                      } else {
                        List<Map> result =
                            await validateLogin(email.text, password.text);
                        if (result.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login Success!')),
                          );
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserHomepage(data: result)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Not registered!')),
                          );
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registrationpg1()));
                        }
                      }
                    }
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Registrationpg1()));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white70,
                      foregroundColor: Colors.black87),
                  child: const Text("Create an account"),
                ),
              ),
            ], // Column children
          ),
        ),
      ),
    );
  }
}

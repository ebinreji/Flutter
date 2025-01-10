import 'package:flutter/material.dart';
import 'package:julyfultterproject/SQFLITE%20EXAMPLE%20WORK/examplesqflitehelper.dart';
import 'package:julyfultterproject/SQFLITE%20EXAMPLE%20WORK/loginpg.dart';

void main() => runApp(MaterialApp(
      home: Registrationpg1(),
      debugShowCheckedModeBanner: false,
    ));

class Registrationpg1 extends StatefulWidget {
  const Registrationpg1({super.key});

  @override
  State<Registrationpg1> createState() => _Registrationpg1State();
}

class _Registrationpg1State extends State<Registrationpg1> {
  bool showPass = true;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // List<Map<String, dynamic>> user_details_from_db = [];
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getUserData();
  // }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  // void getUserData() async {
  //   final data = await SQLHelper.getUserData();
  //   setState(() {
  //     user_details_from_db = data;
  //   });
  // }

  Future<void> createNewUser() async {
    int? id = await SQLHelper.createNewUser(
      emailController.text,
      passwordController.text,
      nameController.text,
    );

    if (id != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error registering user')),
      );
    }
  }

  Future<bool> findUser(String email) async {
    var user = await SQLHelper.findUser(email);
    return user.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Colors.white38,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 200),
                child: Text(
                  "Registration",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140, left: 20, right: 20),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_3),
                    hintText: "Full Name",
                    labelText: "Full Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  validator: (name) {
                    if (name!.isEmpty) {
                      return "Enter full name";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(

                    hintText: "Email",
                    labelText: "Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
                    prefixIcon: Icon(Icons.person),),
                  validator: (email) {
                    if (email!.isEmpty ||
                        !email.contains('@gmail') ||
                        !email.contains('.com')) {
                      return "Enter valid Email";
                    }else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  controller: passwordController,
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
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: TextFormField(
                  controller: confirmPasswordController,
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
                    hintText: "Confirm Password",
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return "Enter a valid password";
                    } else if (password != passwordController.text) {
                      return "Passwords do not match";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  var valid = formKey.currentState!.validate();
                  if (valid) {
                    bool userExists = await findUser(emailController.text);
                    if (userExists) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('User already exists with this email')),
                      );
                    } else {
                      await createNewUser();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginpage1()),
                      );
                    }
                  }
                },
                child: const Text("Register"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Loginpage1()));
                    },
                    child: Text('Already have an account? Log in!')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

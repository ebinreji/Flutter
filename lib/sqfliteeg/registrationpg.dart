import 'package:flutter/material.dart';
import 'package:julyfultterproject/sqfliteeg/Bottamsheet.dart';
import 'package:julyfultterproject/sqfliteeg/loginpg.dart';
import 'package:julyfultterproject/sqfliteeg/sqfliteeg.dart';

void main() => runApp(MaterialApp(
  home: RegPage(),
  debugShowCheckedModeBanner: false,
));

class RegPage extends StatefulWidget {
  const RegPage({super.key});

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  bool showPass = true;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
  }

  Future<void> createNewUser() async {
    int? id = await Sqfhelper.createNotes(
      nameController.text,
      addressController.text,
      emailController.text,
      passwordController.text,
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
    var user = await Sqfhelper.findUser(email);
    return user.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.yellow[30],
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 80),
                  child: Text(
                    "Registration",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      prefix: Icon(Icons.person_add_alt_1),
                      hintText: "Name",
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      prefix: Icon(Icons.home),
                      hintText: "Address",
                      labelText: "Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (email) {
                      if (email!.isEmpty ||
                          !email.contains('@') ||
                          !email.contains('.')) {
                        return "Enter valid Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: showPass,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(showPass
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                      ),
                    ),
                    validator: (password) {
                      if (password!.isEmpty || password.length < 6) {
                        return "Enter valid password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                  child: TextFormField(
                    controller: confirmController,
                    obscureText: showPass,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(showPass
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                          });
                        },
                      ),
                    ),
                    validator: (confirmPassword) {
                      if (confirmPassword!.isEmpty ||
                          confirmPassword.length < 6 ||
                          confirmPassword != passwordController.text) {
                        return "Passwords do not match";
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
                      foregroundColor: Colors.white),
                  onPressed: () async {
                    var valid = formKey.currentState!.validate();
                    if (valid) {
                      bool userExists = await findUser(emailController.text);
                      if (userExists) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'User already exists with this email')),
                        );
                      } else {
                        await createNewUser();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Lgpg1()),
                        );
                      }
                    }
                  },
                  child: Text("  Register  "),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Lgpg1()),
                      );
                    },
                    child: Text('Already have an account? Log in!'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

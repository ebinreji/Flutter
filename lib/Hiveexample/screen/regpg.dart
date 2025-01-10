import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:julyfultterproject/Hiveexample/database/database.dart';
import 'package:julyfultterproject/Hiveexample/model/usermodel.dart';
import 'package:julyfultterproject/Hiveexample/screen/loginpg.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('User');
  runApp(GetMaterialApp(
    home: Rgpg(),
    debugShowCheckedModeBanner: false,
  ));
}

class Rgpg extends StatefulWidget {
  const Rgpg({super.key});

  @override
  State<Rgpg> createState() =>
      _RgpgState();
}

class _RgpgState extends State<Rgpg> {
  bool showPass = true;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void validateSignUp() async {
    final email = emailController.text.trim();
    final pass = passwordController.text.trim();
    final cpass = confirmPasswordController.text.trim();

    final emailValidationResult = EmailValidator.validate(email);

    if (email != '' && pass != '' && cpass != '') {
      if (emailValidationResult == true) {
        final passValidationResult = checkPassword(pass, cpass);
        if(passValidationResult == true) {
          final user = User(email: email, password: cpass);

          await DBfunction.instance.userSignUp(user);
          // await DBFunction.instance.printAllUserDetails();
          Get.back();
          Get.snackbar('Success', 'Account created!');
          Get.to(Lgpg());
        }
      } else {
        Get.snackbar('Error', 'Provide a valid email');
      }
    } else {
      Get.snackbar('Error', 'Fields cannot be empty');
    }
  }

  bool checkPassword(String pass, String cpass) {
    if (pass == cpass) {
      if (pass.length < 6) {
        Get.snackbar(
            "Error", 'Password length must have at least 6 characters');
        return false;
      } else {
        return true;
      }
    } else {
      Get.snackbar('Error', 'Password mismatch');
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
        child: Container(
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email),
              hintText: "Email",
              labelText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
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
    ),

        ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    validateSignUp();
                  },
                  child: const Text("Register"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: TextButton(
                      onPressed: () {
                        Get.to(Lgpg());
                      },
                      child: Text('Already have an account? Log in!')),
                ),
              ],
          ),
        ),
        ),
        ),
    );
  }
}

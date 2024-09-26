import 'package:flutter/material.dart';
import 'package:julyfultterproject/assignment/homepagehotel.dart';
import 'package:julyfultterproject/assignment/registrationhotel.dart';

class Loginpagehotel extends StatefulWidget {
  const Loginpagehotel({super.key});

  @override
  State<Loginpagehotel> createState() => _LoginpagehotelState();
}

class _LoginpagehotelState extends State<Loginpagehotel> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool showpass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 80),
                child: Text(
                  "Login",
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
                  decoration: InputDecoration(
                    hintText: "Enter a email",
                    labelText: "email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.person_2),
                  ),
                  validator: (username){
                    if(username!.isEmpty ||
                        !username.contains('@gmail')||
                        !username.contains('.com')){
                      return"Enter valid email";
                    }
                    else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70, right: 70),
                child: TextFormField(
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
                      icon: Icon(showpass == true
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          showpass = !showpass;

                        });
                      },
                    ),
                  ),
                  validator: (password){
                    if(password!.isEmpty || password.length<6){
                      return "Enter valid password";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  var valid=formkey.currentState!.validate();
                  if(valid){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepagehotel()));
                  }
                  // Add your login logic here
                },
                child: Text("Login"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextButton(
                  onPressed: () {
Navigator.push(context,MaterialPageRoute(builder: (context)=>const Registration1()));
                  },
                  child: Text("Create an account",style: TextStyle(color: Colors.black),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class loginpage extends StatelessWidget {
  const loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          color: Colors.yellow[100],
        child:Column(children: [
          Padding(
            padding:const EdgeInsets.only(left: 50,top: 80),
         child: Text("Loginpage",
           style: TextStyle(fontSize: 20,
               color: Colors.black87,
               fontWeight: FontWeight.bold),),
    ),

          Padding(
            padding: const EdgeInsets.only(top: 30,left: 70,right: 70),
    child: TextField(
      decoration: InputDecoration(
        prefix: Icon(Icons.person),
        hintText: "Username",
        labelText: "Username",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
      ),
    ),
    ),

          Padding(
            padding: const EdgeInsets.only(top: 30,left: 70,right: 70),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                suffixIcon: Icon(Icons.visibility_off),
                hintText: "Password",
                  labelText: "Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            ),
          ),

        SizedBox(height: 40,),
         ElevatedButton(
             style: ElevatedButton.styleFrom(backgroundColor: Colors.white54,foregroundColor: Colors.red)
             ,onPressed: (){},
           child: Text("  Login  ")),

          Padding(
            padding: const EdgeInsets.only(top: 50),
           child: TextButton(onPressed: (){}, child: Text("Not a user ? create an account !")),
          )

        ],)
      )
    );
  }

}


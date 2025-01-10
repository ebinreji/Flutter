import 'package:flutter/material.dart';

class Profilepg extends StatefulWidget {
  final dynamic data1;

  const Profilepg({Key? key, required this.data1}) : super(key: key);

  @override
  State<Profilepg> createState() => _ProfilepgState();
}

class _ProfilepgState extends State<Profilepg> {
  late String name;
  late String address;
  late String email;
  late String password;

  @override
  void initState() {
    super.initState();
    name = widget.data1[0]["name"];
    address = widget.data1[0]["address"];
    email = widget.data1[0]["email"];
    password = widget.data1[0]["password"];
  }

  void _navigateAndEditProfile(BuildContext context) async {
    // Open Edit Screen and wait for the updated data
    final updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfile(
          name: name,
          address: address,
          email: email,
          password: password,
        ),
      ),
    );

    // If updated data is returned, update the profile information
    if (updatedData != null) {
      setState(() {
        address = updatedData['address'];
        password = updatedData['password'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _navigateAndEditProfile(context),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 5,
            child: Column(
              children: [
                ListTile(
                  title: Text("Name"),
                  subtitle: Text(name),
                  leading: Icon(Icons.person),
                ),
                Divider(),
                ListTile(
                  title: Text("Address"),
                  subtitle: Text(address),
                  leading: Icon(Icons.location_on),
                ),
                Divider(),
                ListTile(
                  title: Text("Email"),
                  subtitle: Text(email),
                  leading: Icon(Icons.email),
                ),
                Divider(),
                ListTile(
                  title: Text("Password"),
                  subtitle: Text(password),
                  leading: Icon(Icons.lock),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfile extends StatefulWidget {
  final String name;
  final String address;
  final String email;
  final String password;

  const EditProfile({
    Key? key,
    required this.name,
    required this.address,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    addressController = TextEditingController(text: widget.address);
    emailController = TextEditingController(text: widget.email);
    passwordController = TextEditingController(text: widget.password);
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Collect updated data and pass it back
              Navigator.pop(context, {
                'address': addressController.text,
                'password': passwordController.text,
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
              readOnly: true, // Make Name read-only
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: "Address"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
              readOnly: true, // Make Email read-only
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}


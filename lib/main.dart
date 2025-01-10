import 'package:flutter/material.dart';
import 'package:julyfultterproject/Provider/provider.dart';
import 'package:julyfultterproject/Provider/screens/widget/Home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [ChangeNotifierProvider(create: (_)=> RecipeProvider()..fetchRecipes())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'welcome',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:RecipeListPage(),
    ),
    );
  }
}


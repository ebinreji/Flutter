import 'package:flutter/material.dart';
import 'package:julyfultterproject/Provider/provider.dart';
import 'package:julyfultterproject/Provider/screens/widget/recipeGride.dart';
import 'package:provider/provider.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeProvider = Provider.of<RecipeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Recipes"),
        actions: [],),
      body: recipeProvider.recipes.isEmpty ? Center(
        child: CircularProgressIndicator(),) : LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 600) {
              return RecipeGridView(
                  recipeProvider.recipes, 4, constraints.maxWidth);
            } else if (constraints.maxWidth >= 400) {
              return RecipeGridView(
                  recipeProvider.recipes, 2, constraints.maxWidth);
            } else {
              return RecipeGridView(
                  recipeProvider.recipes, 1, constraints.maxWidth);
            }
          })
      ,
    );
  }
}

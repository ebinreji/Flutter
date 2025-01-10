import 'package:flutter/cupertino.dart';
import 'package:julyfultterproject/Provider/model.dart';
import 'package:julyfultterproject/Provider/service.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> _filteredRecipes = [];

  List<Recipe> get recipes => _filteredRecipes.isNotEmpty ? _filteredRecipes : _recipes;

  Future<void> fetchRecipes() async {
    try {
      Welcome recepie = await RecipeService().fetchProducts();
      _recipes = recepie.recipes ?? [];
      _filteredRecipes = _recipes;
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching recipes: $e');
      throw Exception('Failed to load recipes');
    }
  }

  void searchRecipes(String query) {
    _filteredRecipes = _recipes.where((recipe) {
      return recipe.name?.toLowerCase().contains(query.toLowerCase()) ?? false;
    }).toList();
    notifyListeners();
  }
}

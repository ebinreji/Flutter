import 'package:http/http.dart'as http;

import '../model/productmodel.dart';
import 'model.dart';

class RecipeService{
  final String baseUrl = "https://dummyjson.com/recipes";
  Future<Welcome>fetchProducts()async{
    var response = await http.get(Uri.parse("$baseUrl/recipes"));
    if(response.statusCode ==200){
      var data = response.body;
      return Welcome.fromJson(data as Map<String, dynamic>);

    }
    else{
      throw Exception('failed to load recipes');
    }
  }
}
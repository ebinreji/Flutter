import 'dart:convert';
import 'package:http/http.dart' as http;

class FakestoreService {
  final String baseUrl = "http://fakestoreapi.com";

  Future<List<String>> getMainCategories() async {
    final response = await http.get(Uri.parse("$baseUrl/products/categories"));
    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = json.decode(response.body);
      List<String> mainCategories = categoriesJson.map((categoriesJson) => categoriesJson.toString()).toList();
      return mainCategories;
    }else {
      throw Exception('faild to load main categories');
    }
  }





Future<List<Map<String, dynamic>>> getProductsByCategory(String category) async {
  final response = await http.get(Uri.parse("$base64Url/products/category/$category"));
  if(response.statusCode ==200) {
    return List<Map<String, dynamic>>.from(json.decode(response.body));
  } else {
    throw Exception('failed to load products for category $category');
  }}
}
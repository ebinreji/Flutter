import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart'; // Adjust your import paths as needed

class NewsApiService {
  final String _apiKey = "6fddf50b813d4427ba9277355cdaeec4";
  final String _baseUrl = "https://newsapi.org/v2";

  Future<NewsResponse> fetchNewsByKeywords(String keywords) async {
    if (keywords.isEmpty) {
      throw ArgumentError("Keywords cannot be empty");
    }

    try {
      final uri = Uri.parse("$_baseUrl/everything?q=$keywords&apiKey=$_apiKey");
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return NewsResponse.fromJson(data);
      } else {
        // Provide detailed error message from the API response if available
        final errorData = jsonDecode(response.body);
        throw Exception(
            "Failed to fetch news: ${errorData['message'] ?? 'Unknown error'}"
        );
      }
    } catch (e) {
      // Catch network errors and unexpected issues
      throw Exception("An error occurred: ${e.toString()}");
    }
  }
}

import 'package:flutter/material.dart';
import '../News%20api/service.dart'; // Ensure correct import path
import '../News%20api/model.dart'; // Import your model

void main() {
  runApp(
    MaterialApp(
      home: NewsListScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class NewsListScreen extends StatefulWidget {
  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  late Future<NewsResponse> _newsFuture;

  @override
  void initState() {
    super.initState();
    final apiService = NewsApiService();
    _newsFuture = apiService.fetchNewsByKeywords('technology');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Articles"),
      ),
      body: FutureBuilder<NewsResponse>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.articles.isEmpty) {
            return const Center(
              child: Text("No articles found"),
            );
          }

          final articles = snapshot.data!.articles;
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: article.urlToImage != null
                      ? Image.network(
                    article.urlToImage!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.broken_image,
                      size: 100,
                    ),
                  )
                      : const Icon(Icons.broken_image, size: 100),
                  title: Text(article.title),
                  subtitle: Text(article.description ?? "No description"),
                  onTap: () {
                    _showArticleDetails(context, article);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showArticleDetails(BuildContext context, Article article) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(article.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            article.urlToImage != null
                ? Image.network(article.urlToImage!)
                : const Icon(Icons.broken_image, size: 100),
            const SizedBox(height: 8),
            Text(article.content ?? "No content available"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}

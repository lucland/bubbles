import 'dart:convert';

import 'package:bubbles/models/NewsModel.dart';
import 'package:http/http.dart' as http;

class NewsData {
  List<NewsModel>? news = [];

  Future<List<NewsModel>?> getNews() async {
    Uri url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b4026e499a7742f88ef6c48c1502caf4"
            as Uri;

    try {
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      if (jsonData['status'] == "ok") {
        jsonData["articles"].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            NewsModel newsModel = NewsModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
              publishedAt: DateTime.parse(element['publishedAt']).toString(),
            );
            print(newsModel.toString());
            return news?.add(newsModel);
          }
        });
      }
      return news;
    } catch (e) {
      print(e);
    }
  }
}

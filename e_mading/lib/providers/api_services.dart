import 'dart:convert';

import 'package:http/http.dart';

import '../model/news_model.dart';
class ApiService {
  final endPointUrl = Uri.parse(
      "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=d096545346e9429ba1cb98050b7ba704");
  
  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

  
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}


import 'package:http/http.dart'as http;
import 'package:news_apps/features/news_features/models/news_model.dart';
import 'dart:convert';

import 'package:http/http.dart';


class ApiService {
  final all_news_url =
      "https://newsapi.org/v2/everything?q=*&apiKey=4d1246aa4825400495ba800faf5020a3";

  final breaking_news_url =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=4d1246aa4825400495ba800faf5020a3";

  Future<List<NewsModels>> getAllNews() async {
    try {
      Response response = await get(Uri.parse("https://newsapi.org/v2/everything?q=bitcoin&apiKey=4d1246aa4825400495ba800faf5020a3"));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        print(await body);

        List<NewsModels> articles = body.map((dynamic item) => NewsModels.fromJson(item)).toList();
        return articles;
      } else {
        throw ("No artile found");
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<List<NewsModels>> getBreakingNews() async {
    try {
      Response response = await get(Uri.parse(breaking_news_url));
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModels> articles =
        body.map((dynamic item) => NewsModels.fromJson(item)).toList();
        return articles;
      } else {
        throw ("No artile found");
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
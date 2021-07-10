import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_task_flutter/constants/strings.dart';
import 'package:test_task_flutter/models/news_info.dart';

// ignore: camel_case_types
class API_Manager {
  Future<NewsModels> getNews() async {
    var client = http.Client();
    var newsModel = null;
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NTksImlhdCI6MTYyMDQ5MTYxNCwiZXhwIjoxMDAxNjIwNDkxNjE0fQ.zGqmT0dH2bUMkG5DltUciML5CCXDbXsdO3p5a6AH5Z8';
    try {
      var postRequest = await client.post(
        (Uri.parse(Strings.news_url_access_token)),
        headers: {
          "Accept": "*/*",
          "Authorization": "Bearer $token",
        },
      );
      if (postRequest.statusCode == 200) {
        var jsonStringPost = postRequest.body;
        var jsonMapPost = json.decode(jsonStringPost);
        var getRequest = await client.get(
          Uri.parse(Strings.news_url_news),
          headers: {
            "Accept": "*/*",
            "Authorization": "Bearer ${jsonMapPost["result"]["access"]}",
          },
        );
        if (getRequest.statusCode == 200) {
          var jsonString = getRequest.body;
          var jsonMap = json.decode(jsonString);
          newsModel = NewsModels.fromJson(jsonMap);
        }
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}

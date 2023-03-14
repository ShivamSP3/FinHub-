import 'dart:convert';

import 'package:flutter_node_auth/models/news.dart';
import 'package:flutter_node_auth/providers/news_provider.dart';
import 'package:http/http.dart' as http ;
class News {
  List<ArticleModel> news = [];
  NewsProvider newsProvider = NewsProvider();
  Future<void> getNews () async{
    var url = Uri.parse('https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=621218e70a9f4353acceef57aa6da2d2');
    http.Response response = await  http.get(url);
   var jsonData = jsonDecode(response.body);
   if(jsonData['status']== "ok"){
     //  newsProvider.setNews(jsonData['artices']);
      jsonData["articles"].forEach((element){
      if(element["urlToImage"]!= null && element['description'] != null){
        ArticleModel articleModel = ArticleModel(
          title:  element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage:  element['urlToImage'],
          content: element['content']
        );
        news.add(articleModel);
      }
    });
   } 
  }

}

class CategoryNewsClass{
  List<ArticleModel> news = [];
  Future<void> getNews (String category) async{
     var url = Uri.parse('https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=23055e2fc4e542c7b1230014cc08d162');
    http.Response response = await  http.get(url);
  var jsonData = jsonDecode(response.body);
   if(jsonData['status']== "ok"){
    jsonData["articles"].forEach((element){
      if(element["urlToImage"]!= null && element['description'] != null){
        ArticleModel articleModel = ArticleModel(
        
          title:  element['title'],
          author: element['author'],
          description: element['description'],
          url: element['url'],
          urlToImage:  element['urlToImage'],
          content: element['content']
        );
        news.add(articleModel);
      }
    });
   } 
  }

}
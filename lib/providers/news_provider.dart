import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_node_auth/models/news.dart';
import 'package:flutter_node_auth/models/user.dart';

class NewsProvider extends ChangeNotifier{
   
   ArticleModel _articleModel = ArticleModel(author: '', title: '', description: '', url: '', urlToImage: '', content: '');

  ArticleModel get articleModel => _articleModel;
  void setNews(String news){
    _articleModel = ArticleModel.fromJson(news);
    notifyListeners();
  }
  void setNewsFromModel(User user){
    _articleModel = articleModel;
    notifyListeners();
  }
  }
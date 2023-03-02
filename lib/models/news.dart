// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ArticleModel {
  String? author;

  String title;

  String description;

  String url;

  String urlToImage;

  String? content;

  ArticleModel(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.content});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'content': content,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
     author : map['author'] ?? '',
     title :  map['title'] as String,
      description : map['description'] as String,
      url : map['url'] as String,
     urlToImage :  map['urlToImage'] as String,
      content : map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) => ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

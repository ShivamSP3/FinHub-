// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String token;
  final String password;
  final List<dynamic>? trades;

  User({
    required this.trades,
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'token': token,
      'password': password,
      'trades':trades
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      password: map['password'] ?? '', 
      trades: []
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));


  User copyWith({
    String? id,
    String? name,
    String? email,
    String? token,
    String? password,
    List<dynamic>? trades,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      token: token ?? this.token,
      password: password ?? this.password,
      trades: trades ?? this.trades,
    );
  }
}

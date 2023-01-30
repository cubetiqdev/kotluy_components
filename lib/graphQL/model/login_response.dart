import 'dart:convert';

import 'package:flutter/foundation.dart';

class LoginResponse {
  final String? accessToken;
  final String? refreshToken;
  final User? user;

  LoginResponse({this.accessToken, this.refreshToken, this.user});

  static LoginResponse? fromGraphQLResult(dynamic result) {
    if (result.isOk) {
      return fromJson(result.data?['data']);
    } else {
      if (kDebugMode) {
        print("Result is error: ${result.errorMessage}");
      }
      return null;
    }
  }

  static LoginResponse fromJson(dynamic json) {
    if (json == null) {
      return LoginResponse();
    }

    return LoginResponse(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      user: json['user'].map<User>((e) => User.fromJson(e)).toList(),
    );
  }

  String toJson() {
    var json = {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'user': user,
    };
    return jsonEncode(json);
  }

  LoginResponse fromMap(Map<String, dynamic> map) {
    return LoginResponse.fromJson(map);
  }
}

class User {
  final String? id;
  final String? name;

  User({this.id, this.name});

  static User fromJson(dynamic json) {
    if (json == null) {
      return User();
    }

    return User(
      id: json['id'],
      name: json['name'],
    );
  }

  String toJson() {
    var json = {
      'id': id,
      'name': name,
    };
    return jsonEncode(json);
  }

  User fromMap(Map<String, dynamic> map) {
    return User.fromJson(map);
  }
}

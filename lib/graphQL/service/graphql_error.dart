import 'dart:convert';

import 'package:flutter/foundation.dart';

class GraphQLError {
  final String? message;
  final List<dynamic>? path;
  final dynamic locations;
  final dynamic extensions;
  final int? status;

  GraphQLError(
      this.message, this.path, this.locations, this.extensions, this.status);

  static GraphQLError? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }

    try {
      var data = json;
      if (json is String) {
        data = jsonDecode(json);
      }

      final message = data['message'];
      final path = data['path'];
      final locations = data['locations'];
      final extensions = data['extensions'];
      final status = data['status'];
      return GraphQLError(message, path, locations, extensions, status);
    } catch (e) {
      if (kDebugMode) {
        print("GraphQLError Error => $e");
      }
      return null;
    }
  }
}

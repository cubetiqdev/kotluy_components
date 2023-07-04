// ignore_for_file: prefer_final_fields, avoid_print, unnecessary_new, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/foundation.dart';

class Console {
  static bool _isDebug = kDebugMode;

  static void log(text, data) {
    if (_isDebug == false) {
      return;
    } else {
      if (text == null || text == '') {
        text = 'Console.log';
      }

      Print.out('\x1B[32m================== $text ==================\x1B[0m');
      Print.out(data);
      Print.out('\x1B[32m===========================================\x1B[0m');
    }
  }

  static void print(text) {
    if (_isDebug == false) {
      return;
    } else {
      Print.out(text);
    }
  }

  static void log2({
    String? name,
    dynamic data,
  }) {
    if (_isDebug == false) {
      return;
    } else {
      log(name, data);
    }
  }

  static void warning(text, data) {
    if (_isDebug == false) {
      return;
    } else {
      Print.out('\x1B[33m================== $text ==================\x1B[0m');
      Print.out(data);
      Print.out('\x1B[33m===========================================\x1B[0m');
    }
  }

  static void error(text, data) {
    if (_isDebug == false) {
      return;
    } else {
      Print.out('\x1B[31m================== $text ==================\x1B[0m');
      Print.out(data);
      Print.out('\x1B[31m===========================================\x1B[0m');
    }
  }

  static void jsonAll(data) {
    if (_isDebug == false) {
      return;
    } else {
      JsonEncoder encoder = new JsonEncoder.withIndent('  ');
      String prettylint = encoder.convert(data);
      prettylint
          .split('\n')
          .forEach((element) => Console.log("Render JSON", prettylint));
    }
  }
}

class Print {
  static void out(message) {
    print(message);
  }
}

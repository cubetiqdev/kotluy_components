// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test/components/buttons/button.dart';

void main() => runApp(const MyWidget());

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ButtonCustom(),
      ),
    );
  }
}

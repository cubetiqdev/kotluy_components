import 'package:flutter/material.dart';
import 'package:flutter_components/extension/screen_util.dart';
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
    return ScreenUtilInit(
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: ButtonCustom(),
          ),
        );
      },
    );
  }
}

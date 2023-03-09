import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/animation_progress_button/animation_progress_button.dart';
import 'package:flutter_components/widgets/square_tile_logo/square_tile.dart';
import 'package:flutter_components/widgets/text_field_custom/custom_textfield.dart';
import 'package:flutter_components/widgets/text_field_custom/custom_textformfield.dart';
import 'package:flutter_components/widgets/text_field_custom/password_textfield.dart';
import 'package:flutter_components/widgets/text_field_custom/phone_textfield.dart';

class ButtonCustom extends StatefulWidget {
  const ButtonCustom({super.key});

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  ButtonState state = ButtonState.init;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Button Custom"),
            backgroundColor: Colors.deepOrangeAccent,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimationProgressButton(
                  state: state,
                  onPressed: () async {
                    setState(() {
                      state = ButtonState.loading;
                    });
                    await Future.delayed(const Duration(seconds: 1));
                    setState(() {
                      state = ButtonState.done;
                    });
                    await Future.delayed(const Duration(seconds: 1));
                    setState(() {
                      state = ButtonState.init;
                    });
                  },
                  title: 'AnimationProgressButton',
                ),
                SquareTile(
                  imagePath: '',
                )
              ],
            ),
          )),
    );
  }
}

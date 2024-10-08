import 'package:flutter/material.dart';
import 'package:flutter_components/components/button_custom/animation_progress_button/animation_progress_button.dart';
import 'package:flutter_components/components/button_custom/button_choose_language/button_choose_language.dart';
import 'package:flutter_components/components/button_custom/flag_language_button/language_with_flags.dart';
import 'package:flutter_components/components/button_custom/outline_button/outline_button.dart';
import 'package:flutter_components/components/button_custom/social_media_button/social_media_button.dart';
import 'package:flutter_components/components/button_custom/square_tile_logo/square_tile.dart';

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
      child: Material(
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
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 200,
                    width: 300,
                    child: const SquareTile(
                      imagePath: 'assets/icons/apple_logo.png',
                    ),
                  ),
                  SocialMediaButton(
                    title: 'Sign in with Apple',
                    image: 'assets/icons/apple_logo.png',
                    onTap: () {},
                  ),
                  const ButtonChooseLanguage(
                    title: 'English',
                    image: 'assets/icons/apple_logo.png',
                  ),
                  const LanguageWithFlags(
                    countryFlags: 'assets/icons/apple_logo.png',
                    language: 'English',
                    select: true,
                  ),
                  const SocialMediaButton(
                    width: 160,
                    image: 'assets/icons/apple_logo.png',
                    title: 'Apple',
                  ),
                  const SizedBox(
                    width: 160,
                    child: ButtonChooseLanguage(
                      title: "ភាសាខ្មែរ",
                      image: 'assets/icons/apple_logo.png',
                      colorSelect: Colors.amber,
                    ),
                  ),
                  const OutlineButton(
                    title: 'English',
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

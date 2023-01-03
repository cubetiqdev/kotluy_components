// ignore_for_file: file_names

import 'package:component_sdk/components/text/custom_text_component.dart';
import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final String title;
  final Color? borderColor;
  final String image;
  final String? fallbackText;
  final Color? iconColor;
  final Color? fontColor;
  final Color? buttonColor;
  final bool t;
  const SocialMediaButton(
      {Key? key,
      this.fallbackText,
      this.borderColor,
      this.title = "",
      this.image = "",
      this.iconColor,
      this.fontColor,
      this.buttonColor,
      this.t = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        color: buttonColor ?? Colors.white,
        border: Border.all(width: 1, color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
            child: Image.asset(
              image,
              height: 20,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 10),
          CTextCustoms(
            min: 12,
            t: t,
            text: title,
            fallbackText: fallbackText,
            style: TextStyle(color: fontColor ?? Colors.black),
          ),
        ],
      ),
    );
  }
}

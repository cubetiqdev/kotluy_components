// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final String title;
  final String image;
  final String? fallbackText;
  final Color? borderColor;
  final Color? iconColor;
  final Color? fontColor;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final double? imageHeight;
  final double? iamgeWidth;
  final double padHorizontal;
  final double padVertical;
  final bool t;
  final void Function()? onTap;
  const SocialMediaButton({
    Key? key,
    this.title = "",
    this.image = "",
    this.fallbackText,
    this.borderColor,
    this.iconColor,
    this.fontColor,
    this.buttonColor,
    this.height,
    this.width,
    this.imageHeight,
    this.iamgeWidth,
    this.padHorizontal = 20,
    this.padVertical = 10,
    this.t = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: padHorizontal, vertical: padVertical),
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 45,
          decoration: BoxDecoration(
            color: buttonColor ?? Colors.white,
            border: Border.all(width: 1, color: borderColor ?? Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                child: Image.asset(
                  image,
                  width: iamgeWidth,
                  height: imageHeight ?? 20,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(color: fontColor ?? Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

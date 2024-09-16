// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  final String title;
  final String image;
  final Color? borderColor;
  final Color? iconColor;
  final Color? fontColor;
  final Color? buttonColor;
  final double? height;
  final double? width;
  final double? imageHeight;
  final double? imageWidth;
  final double padHorizontal;
  final double padVertical;
  final double? borderRadius;
  final TextStyle? textStyle;
  final void Function()? onTap;
  const SocialMediaButton({
    super.key,
    this.title = "",
    required this.image,
    this.borderColor,
    this.iconColor,
    this.fontColor,
    this.buttonColor,
    this.height,
    this.width,
    this.imageHeight,
    this.imageWidth,
    this.padHorizontal = 20,
    this.padVertical = 10,
    this.borderRadius,
    this.textStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: padHorizontal, vertical: padVertical),
        child: Container(
          width: width ?? 160,
          height: height ?? 50,
          decoration: BoxDecoration(
            color: buttonColor ?? Colors.white,
            border: Border.all(width: 1, color: borderColor ?? Colors.black),
            borderRadius: BorderRadius.circular(borderRadius ?? 50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: imageWidth ?? 24,
                height: imageHeight ?? 24,
                child: Image.asset(
                  image,
                  color: iconColor,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: textStyle ??
                    TextStyle(
                      color: fontColor ?? Colors.black,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

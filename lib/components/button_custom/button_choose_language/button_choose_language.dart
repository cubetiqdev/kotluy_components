// ignore_for_file: prefer_const_constructors

import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';
import 'package:flutter/material.dart';

class ButtonChooseLanguage extends StatelessWidget {
  final String title;
  final String image;
  final String? icon;
  final TextStyle? textStyle;
  final Color? colorSelect;
  final Color? colorText;
  final Color? colorIcon;
  final Color? borderColor;
  final double padHorizontal;
  final double padVertical;
  final double? imgHeight;
  final double? imgWidth;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final double? imageRadius;
  final GestureTapCallback? onTap;
  const ButtonChooseLanguage({
    super.key,
    required this.title,
    required this.image,
    this.icon,
    this.textStyle,
    this.colorSelect,
    this.colorText,
    this.colorIcon,
    this.borderColor,
    this.padHorizontal = 20,
    this.padVertical = 0,
    this.imgHeight,
    this.imgWidth,
    this.height,
    this.width,
    this.padding,
    this.borderRadius,
    this.imageRadius,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padHorizontal, vertical: padVertical),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius ?? 50),
        child: Container(
          height: height,
          width: width,
          padding: padding ??
              const EdgeInsets.only(
                  left: 20.0, right: 5.0, top: 10.0, bottom: 10.0),
          alignment: Alignment(0, 0),
          decoration: BoxDecoration(
            color: colorSelect,
            border: Border.all(
                width: 1.0, color: borderColor ?? ThemeColor.DARK_D4),
            borderRadius: BorderRadius.circular(borderRadius ?? 50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(imageRadius ?? 20),
                child: Image.asset(
                  image,
                  width: imgWidth ?? 24.0,
                  height: imgHeight ?? 24.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                title,
                style: KLabelTextMedium14.copyWith(
                    color: colorText ?? ThemeColor.DARK_Black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

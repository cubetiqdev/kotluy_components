import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';
import 'package:flutter/material.dart';

class ButtonChooseLanguage extends StatelessWidget {
  final String title;
  final String image;
  final String? icon;
  final Color? colorSelect;
  final Color? colorText;
  final Color? colorIcon;
  final Color? borderColor;
  final double padHorizontal;
  final double padVertical;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final GestureTapCallback? onTap;
  const ButtonChooseLanguage({
    super.key,
    required this.title,
    required this.image,
    this.icon,
    this.colorSelect,
    this.colorText,
    this.colorIcon,
    this.borderColor,
    this.padHorizontal = 20,
    this.padVertical = 0,
    this.padding,
    this.borderRadius,
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
          height: 44,
          padding: padding ??
              const EdgeInsets.only(
                  left: 20.0, right: 5.0, top: 10.0, bottom: 10.0),
          // ignore: prefer_const_constructors
          alignment: Alignment(0, 0),
          decoration: BoxDecoration(
            color: colorSelect,
            border: Border.all(
                width: 1.0, color: borderColor ?? ThemeColor.DARK_D4),
            borderRadius: BorderRadius.circular(borderRadius ?? 50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                title,
                style: KLabelTextMedium14.copyWith(
                    color: colorText ?? ThemeColor.DARK_Black),
              ),

              Image.asset(
                image,
                width: 31.0,
                height: 20.0,
              ),
              // Icon(
              //   Icons.arrow_forward_ios_rounded,
              //   color: colorIcon ?? ThemeColor.DARK_D4,
              //   size: 20,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

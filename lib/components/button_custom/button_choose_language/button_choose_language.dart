import 'package:flutter_components/constant/colors/color.dart';
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
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padHorizontal, vertical: padVertical),
      child: InkWell(
        onTap: onTap,
        radius: 12,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 44,
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
          // ignore: prefer_const_constructors
          alignment: Alignment(0, 0),
          decoration: BoxDecoration(
            color: colorSelect,
            border: Border.all(
                width: 1.0, color: borderColor ?? ThemeColor.DARK_D4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                image,
                width: 31.0,
                height: 20.0,
              ),
              Text(
                title,
                style: KLabelTextMedium14.copyWith(
                    color: colorText ?? ThemeColor.DARK_Black),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: colorIcon ?? ThemeColor.DARK_D4,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

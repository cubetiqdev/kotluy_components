import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';
import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? fillColor;
  final Color? colorText;
  final Color? colorIcon;
  final Color? borderColor;
  final double padHorizontal;
  final double padVertical;
  final double? height;
  final double? borderRadius;
  final double? iconSize;
  final EdgeInsetsGeometry? contentPadding;
  final GestureTapCallback? onTap;
  const OutlineButton({
    super.key,
    required this.title,
    this.icon,
    this.fillColor,
    this.colorText,
    this.colorIcon,
    this.borderColor,
    this.padHorizontal = 20,
    this.padVertical = 0,
    this.height,
    this.borderRadius,
    this.iconSize,
    this.contentPadding,
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
          padding: contentPadding ??
              const EdgeInsets.only(
                  left: 35.0, right: 30.0, top: 15, bottom: 15),
          decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(
                width: 1.0, color: borderColor ?? ThemeColor.DARK_D4),
            borderRadius: BorderRadius.circular(borderRadius ?? 50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: KLabelTextMedium14.copyWith(
                    color: colorText ?? ThemeColor.DARK_Black),
              ),
              Icon(
                icon ?? Icons.arrow_forward_ios_rounded,
                color: colorIcon ?? ThemeColor.DARK_D4,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

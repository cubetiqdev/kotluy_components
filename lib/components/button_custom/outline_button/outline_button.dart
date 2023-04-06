import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';
import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final IconData? icon;
  final Color? fillColor;
  final Color? colorText;
  final Color? colorIcon;
  final Color? borderColor;
  final double? height;
  final double? imgHeight;
  final double? imgWidth;
  final double? borderRadius;
  final double? iconSize;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final GestureTapCallback? onTap;
  const OutlineButton({
    super.key,
    required this.title,
    this.imageUrl,
    this.icon,
    this.fillColor,
    this.colorText,
    this.colorIcon,
    this.borderColor,
    this.height,
    this.imgHeight,
    this.imgWidth,
    this.borderRadius,
    this.iconSize,
    this.textStyle,
    this.contentPadding,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius ?? 50),
      child: Container(
        height: height,
        padding: contentPadding ??
            const EdgeInsets.only(left: 35.0, right: 30.0, top: 15, bottom: 15),
        decoration: BoxDecoration(
          color: fillColor,
          border:
              Border.all(width: 1.0, color: borderColor ?? ThemeColor.DARK_D4),
          borderRadius: BorderRadius.circular(borderRadius ?? 50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: textStyle ??
                  KLabelTextMedium14.copyWith(
                      color: colorText ?? ThemeColor.DARK_Black),
            ),
            imageUrl == null || imageUrl == ''
                ? Icon(
                    icon ?? Icons.arrow_forward_ios_rounded,
                    color: colorIcon ?? ThemeColor.DARK_Black,
                    size: 20,
                  )
                : Image.asset(
                    imageUrl!,
                    height: imgHeight ?? 24,
                    width: imgWidth ?? 24,
                  ),
          ],
        ),
      ),
    );
  }
}

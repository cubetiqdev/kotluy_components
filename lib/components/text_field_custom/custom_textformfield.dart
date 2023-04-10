// ignore_for_file: must_be_immutable

import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';

class CTextFormField extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Color? focusBorderColor;
  final Color? fillColor;
  final Color? hintColor;
  final int? maxLines;
  final int? maxLenght;
  final double? borderRadius;
  final double? borderWidth;
  final double? focusBorderWidth;
  final double? contentPadding;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final bool? filled;
  final bool enabledBorder;
  final bool? noPadding;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextEditingController? controller;
  final List<TextInputFormatter>? format;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  const CTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.textStyle,
    this.borderColor,
    this.focusBorderColor,
    this.fillColor,
    this.hintColor,
    this.maxLines,
    this.maxLenght,
    this.borderRadius,
    this.borderWidth,
    this.focusBorderWidth,
    this.contentPadding,
    this.paddingHorizontal,
    this.paddingVertical,
    this.filled = false,
    this.enabledBorder = false,
    this.noPadding,
    this.textAlign,
    this.textAlignVertical,
    this.controller,
    this.format,
    this.onChanged,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: noPadding == true ? 0 : 20),
      child: TextFormField(
        textAlignVertical: textAlignVertical,
        textAlign: textAlign ?? TextAlign.start,
        style: textStyle ?? KLabelTextRegular14,
        maxLines: maxLines ?? 2,
        maxLength: maxLenght,
        validator: validator,
        inputFormatters: format,
        keyboardType: keyboardType ?? TextInputType.text,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(contentPadding ?? 15),
          filled: filled,
          fillColor: fillColor ?? ThemeColor.LIGHT_L3,
          hintText: hintText,
          hintStyle: KLabelTextRegular14.copyWith(
              color: hintColor ?? ThemeColor.DARK_D4),
          focusedBorder: enabledBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: focusBorderColor ?? ThemeColor.PRIMARY_MAIN,
                    width: focusBorderWidth ?? borderWidth ?? 1,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius ?? 10),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius ?? 0.0)),
          enabledBorder: enabledBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? ThemeColor.DARK_D4,
                    width: borderWidth ?? 1,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius ?? 10),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius ?? 10),
                ),
        ),
      ),
    );
  }
}

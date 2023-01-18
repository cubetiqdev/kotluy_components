import 'package:component_sdk/constant/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CTextFormField extends StatelessWidget {
  TextEditingController? controller;
  final List<TextInputFormatter>? format;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? borderColor;
  final double? borderRadius;
  final Color? focusBorderColor;
  final double borderWidth;
  final double focusBorderWidth;
  final double? focusBorderRadius;
  final String? helperText;
  final String? errorText;
  final Color hintColor;
  final bool? filled;
  final Color fillColor;
  final String? counterText;
  final Color counterColor;
  final bool autofocus;
  final bool enabledBorder;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Color helperColor;
  final bool isPassword;
  final double? contentPadding;
  final double? paddingHorizontal;
  final double? paddingVertical;
  String? Function(String?)? validator;

  CTextFormField(
      {super.key,
      this.format,
      this.validator,
      this.paddingHorizontal,
      this.paddingVertical,
      this.contentPadding,
      this.errorText,
      this.autofocus = false,
      this.isPassword = false,
      this.helperColor = ThemeColor.DARK_D3,
      this.keyboardType,
      this.enabledBorder = false,
      this.counterColor = ThemeColor.DARK_D3,
      this.counterText,
      this.onChanged,
      this.filled = false,
      this.fillColor = ThemeColor.NoColor,
      this.hintColor = ThemeColor.DARK_D3,
      this.helperText,
      this.focusBorderRadius,
      this.focusBorderWidth = 2.0,
      this.borderWidth = 2.0,
      this.focusBorderColor,
      this.hintText,
      this.labelText,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.borderColor,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal ?? 20,
        vertical: paddingVertical ?? 0,
      ),
      child: TextFormField(
        validator: validator,
        inputFormatters: format,
        obscureText: isPassword,
        keyboardType: keyboardType,
        controller: controller,
        autofocus: autofocus,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(contentPadding ?? 20),
          counterText: counterText,
          counterStyle: TextStyle(
            color: counterColor,
          ),
          errorText: errorText,
          filled: filled,
          fillColor: fillColor,
          hintText: hintText,
          labelText: labelText,
          hintStyle: TextStyle(
            color: hintColor,
          ),
          helperText: helperText,
          helperStyle: TextStyle(
            color: helperColor,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          focusedBorder: enabledBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: focusBorderColor ?? ThemeColor.DARK_D1,
                    width: focusBorderWidth,
                  ),
                  borderRadius: BorderRadius.circular(focusBorderRadius ?? 0.0),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius:
                      BorderRadius.circular(focusBorderRadius ?? 0.0)),
          enabledBorder: enabledBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? ThemeColor.DARK_D1,
                    width: borderWidth,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
                ),
        ),
      ),
    );
  }
}

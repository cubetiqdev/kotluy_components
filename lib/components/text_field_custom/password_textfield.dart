// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final String? hintText;
  final bool showPassword;
  final bool? noPadding;
  final bool? enabled;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;

  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapTextField;

  PasswordTextField({
    this.controller,
    this.textStyle,
    this.hintText,
    this.showPassword = false,
    this.noPadding = false,
    this.enabled,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.borderColor,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.onTapTextField,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: noPadding == true ? 0 : 20),
      child: TextFormField(
        enabled: enabled,
        onTap: onTapTextField,
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
        obscureText: showPassword,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 13),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? new BorderRadius.circular(25.0),
            borderSide: BorderSide(
              width: 1,
              color: enabledBorderColor ?? ThemeColor.SECONDARY_5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(25),
            borderSide: BorderSide(
                color: focusedBorderColor ?? ThemeColor.PRIMARY_MAIN, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(25),
            borderSide: BorderSide(
              width: 1,
              color: ThemeColor.SECONDARY_5,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(25),
            borderSide: BorderSide(
              width: 1,
              color: borderColor ?? ThemeColor.SECONDARY_5,
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 29, right: 14),
            child: SizedBox(
              height: 24,
              width: 24,
              child: Icon(
                prefixIcon ?? Icons.lock_outline_rounded,
                color: ThemeColor.SECCONDARY_4,
                size: 16,
              ),
            ),
          ),
          prefixIconColor: prefixIconColor,
          suffixIconColor: suffixIconColor,
          suffixIcon: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(left: 36, right: 29),
              child: SizedBox(
                height: 24,
                width: 24,
                child: Icon(
                  suffixIcon ?? Icons.visibility_off_outlined,
                  color: ThemeColor.SECONDARY_MAIN,
                ),
              ),
            ),
          ),
        ),
        keyboardType: TextInputType.text,
        style: textStyle ?? KLabelTextMedium14,
      ),
    );
  }
}

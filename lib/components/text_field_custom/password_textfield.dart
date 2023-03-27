// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_new

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
  final Widget? prefixIcon;
  final IconData? icon;
  final Color? prefixIconColor;

  final Color? iconColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? borderColor;
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
    this.icon,
    this.prefixIconColor,
    this.iconColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.borderColor,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.onTap,
    this.onTapTextField,
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
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1,
              color: enabledBorderColor ?? ThemeColor.DARK_D4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: focusedBorderColor ?? ThemeColor.PRIMARY_MAIN, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: ThemeColor.DARK_D4,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: borderColor ?? ThemeColor.DARK_D4,
            ),
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          suffixIcon: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
            ),
          ),
        ),
        keyboardType: TextInputType.text,
        style: textStyle ?? KLabelTextRegular12,
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter_components/constant/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';

class CTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final bool hidePassword;
  final bool readOnly;
  final bool? noPadding;
  final bool? enabled;
  final Color? hintTextColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? borderColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapTextField;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;

  const CTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.validator,
    this.textStyle,
    this.controller,
    this.hidePassword = false,
    this.readOnly = false,
    this.noPadding = false,
    this.enabled,
    this.hintTextColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.borderColor,
    this.suffixIconColor,
    this.prefixIconColor,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.onTap,
    this.onTapTextField,
    this.onSaved,
    this.onChanged,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: noPadding == true ? 0 : 20),
      child: TextFormField(
        enabled: enabled,
        onTap: onTapTextField,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        obscureText: hidePassword,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: KLabelTextRegular12.copyWith(
              color: hintTextColor ?? ThemeColor.DARK_D4),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          fillColor: ThemeColor.ERROR,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
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
          suffixIcon: suffixIcon,
          suffixIconColor: suffixIconColor,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
        ),
        keyboardType: keyboardType ?? TextInputType.text,
        style: textStyle ?? KLabelTextRegular12,
      ),
    );
  }
}

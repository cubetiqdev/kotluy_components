// ignore_for_file: prefer_const_constructors

import 'package:flutter_components/constant/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool hidePassword;
  final FormFieldSetter<String>? onSaved;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? borderColor;
  final IconData? suffixIcon;
  final Color? suffixColor;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool? noPadding;
  final GestureTapCallback? onTapTextField;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final String? hintText;
  final String? labelText;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final String? prefixText;
  final TextStyle? prefixStlye;

  const TextFormFieldCustom(
      {super.key,
      this.onTap,
      this.validator,
      this.controller,
      this.hidePassword = false,
      this.onSaved,
      this.suffixColor,
      this.onChanged,
      this.noPadding = false,
      this.onTapTextField,
      this.enabled,
      this.suffixIcon,
      this.inputFormatters,
      this.readOnly = false,
      this.hintText,
      this.labelText,
      this.prefix,
      this.prefixIcon,
      this.prefixIconColor,
      this.prefixText,
      this.prefixStlye,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.borderColor,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: noPadding == true ? 0 : 40),
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
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          fillColor: ThemeColor.ERROR_MAIN,
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
          suffix: suffix,
          suffixIcon: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                suffixIcon,
                color: suffixColor,
                size: 20,
              ),
            ),
          ),
          prefix: prefix,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          prefixText: prefixText,
          prefixStyle: prefixStlye,
        ),
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}

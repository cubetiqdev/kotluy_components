// ignore_for_file: prefer_const_constructors

import 'package:component_sdk/constant/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPasswordCustom extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool hidePassword;
  final FormFieldSetter<String>? onSaved;
  final IconData? suffixIcon;
  final Color? color;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool? noPadding;
  final GestureTapCallback? onTapTextField;
  final bool? enabled;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;

  const TextFieldPasswordCustom(
      {super.key,
      this.onTap,
      this.validator,
      this.controller,
      this.hidePassword = false,
      this.onSaved,
      this.color,
      this.onChanged,
      this.noPadding = false,
      this.onTapTextField,
      this.enabled,
      this.borderColor,
      this.suffixIcon,
      this.inputFormatters,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: noPadding == true ? 0 : 40),
      child: TextFormField(
        enabled: enabled,
        onTap: onTapTextField,
        onChanged: onChanged,
        onSaved: onSaved,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        obscureText: hidePassword,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          fillColor: ThemeColor.ERROR_MAIN,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1,
              color: ThemeColor.DARK_D4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: borderColor ?? ThemeColor.PRIMARY_MAIN, width: 1),
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
              color: ThemeColor.DARK_D4,
            ),
          ),
          suffixIcon: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                suffixIcon,
                color: color,
                size: 20,
              ),
            ),
          ),
        ),
        keyboardType: TextInputType.text,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_new

import 'package:component_sdk/constant/colors/color.dart';
import 'package:component_sdk/constant/fonts/default_font.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool showPassword;
  final FormFieldSetter<String>? onSaved;
  final IconData? icon;
  final Color? color;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool? noPadding;
  final GestureTapCallback? onTapTextField;
  final bool? enabled;

  PasswordTextField(
      {this.onTap,
      this.validator,
      this.controller,
      this.showPassword = false,
      this.onSaved,
      this.icon,
      this.color,
      this.onChanged,
      this.noPadding = false,
      this.onTapTextField,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: noPadding == true ? 0 : 40),
      child: TextFormField(
        enabled: enabled,
        onTap: onTapTextField,
        onChanged: onChanged,
        onSaved: onSaved,
        obscureText: showPassword,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          fillColor: ThemeColor.ERROR_MAIN,
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 1,
              color: ThemeColor.DARK_D4,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: ThemeColor.PRIMARY_MAIN, width: 1),
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
                icon,
                color: color,
                size: 20,
              ),
            ),
          ),
        ),
        keyboardType: TextInputType.text,
        style: KLabelTextNormal12,
      ),
    );
  }
}

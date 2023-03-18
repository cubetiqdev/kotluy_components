// ignore_for_file: prefer_const_constructors

import 'package:flutter_components/constant/colors/color.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';
import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  final String? hintText;
  final String? hintFieldText;
  final T? value;
  final Color? dropdownColor;
  final double? iconSize;
  final ValueChanged<T?> onChanged;
  final List<DropdownMenuItem<T>> items;

  const CustomDropDown(
      {Key? key,
      this.iconSize,
      this.dropdownColor,
      required this.items,
      required this.onChanged,
      this.hintText,
      this.hintFieldText,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      onChanged: onChanged,
      items: items,
      icon: const Icon(Icons.keyboard_arrow_down_sharp,
          color: ThemeColor.DARK_D3),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: ThemeColor.PRIMARY_MAIN,
              width: 1,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: ThemeColor.DARK_D4,
              width: 1,
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: ThemeColor.DARK_D4,
              width: 1,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: ThemeColor.DARK_D4,
              width: 1,
            )),
      ),
      style: KLabelTextNormal12,
      hint: Text(
        hintText ?? '',
        style: KLabelTextNormal12,
      ),
      value: value,
      dropdownColor: dropdownColor,
      iconSize: iconSize ?? 24.0,
    );
  }
}

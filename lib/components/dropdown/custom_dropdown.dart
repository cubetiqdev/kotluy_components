// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';

class CDropDown<T> extends StatelessWidget {
  final T? value;
  final Widget? icon;
  final bool? filled;
  final bool? noPadding;
  final bool isExpanded;
  final String? hint;
  final String? labelText;
  final double? borderRadius;
  final double? iconSize;

  final Color? dropdownColor;
  final Color? hintTextColor;
  final Color? filledColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final ValueChanged<T?> onChanged;
  final List<DropdownMenuItem<T>> items;
  final EdgeInsetsGeometry? contentPadding;
  final Color? iconColor;
  final String? Function(T?)? validator;
  final String? errorText;
  final bool disable;

  const CDropDown({
    Key? key,
    this.disable=false,
    this.value,
    this.icon,
    this.iconColor,
    this.filled,
    this.noPadding,
    this.isExpanded = false,
    this.hint,
    this.labelText,
    this.borderRadius,
    this.iconSize,
    this.dropdownColor,
    this.hintTextColor,
    this.filledColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.borderColor,
    this.textStyle,
    this.hintStyle,
    required this.onChanged,
    required this.items,
    this.contentPadding,
    
    this.validator,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: noPadding == true ? 0 : 20),
      child: IgnorePointer(
        ignoring:disable ,
        child: DropdownButtonFormField<T>(
          validator: validator,
          onChanged: onChanged,
          items: items,
          icon: icon ??
              Icon(Icons.keyboard_arrow_down_rounded,
                  color: iconColor ?? ThemeColor.DARK_Black),
          decoration: InputDecoration(
            errorStyle: KLabelTextRegular12.copyWith(
                color: Theme.of(context).colorScheme.error),
            errorText: errorText,
            filled: filled,
            labelText: labelText,
            // hintText: hint,
            hintStyle: KLabelTextRegular12.copyWith(
                color: hintTextColor ?? ThemeColor.DARK_D4),
            contentPadding: contentPadding ?? EdgeInsets.all(15),
            fillColor: filledColor ?? ThemeColor.ERROR,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
              borderSide: BorderSide(
                width: 1,
                color: enabledBorderColor ?? ThemeColor.SECONDARY_MAIN,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
              borderSide: BorderSide(
                  color: focusedBorderColor ?? ThemeColor.PRIMARY_MAIN, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
              borderSide: BorderSide(
                width: 1,
                color: ThemeColor.DARK_D4,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
              borderSide: BorderSide(
                width: 1,
                color: borderColor ?? ThemeColor.DARK_D4,
              ),
            ),
          ),
          style: textStyle ?? TextStyle(fontSize: 20, color: Colors.black),
          // hint: hint,
          value: value,
          dropdownColor: dropdownColor,
          isExpanded: isExpanded,
          iconSize: iconSize ?? 24.0,
          hint: Text(
            hint ?? '',
            style: hintStyle ??
                KLabelTextRegular12.copyWith(color: ThemeColor.DARK_D4),
          ),
        ),
      ),
    );
  }
}



// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_components/flutter_components.dart';

// class CDropDown<T> extends StatelessWidget {
//   final Widget? hint;
//   final String? labelText;
//   final T? value;
//   final Color? dropdownColor;
//   final double? iconSize;
//   final ValueChanged<T?> onChanged;
//   final List<DropdownMenuItem<T>> items;
//   final Icon? icon;

//   const CDropDown(
//       {Key? key,
//       this.iconSize,
//       this.dropdownColor,
//       required this.items,
//       required this.onChanged,
//       this.hint,
//       this.labelText;,
//       this.value,
//       this.icon})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<T>(
//       onChanged: onChanged,
//       items: items,
//       icon: icon ??
//           const Icon(Icons.keyboard_arrow_down_rounded,
//               color: ThemeColor.DARK_D3),
//       decoration: InputDecoration(
//         contentPadding:
//             const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: const BorderSide(
//               color: ThemeColor.PRIMARY_MAIN,
//               width: 1,
//             )),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(
//               color: ThemeColor.DARK_D4,
//               width: 1,
//             )),
//         disabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(
//               color: ThemeColor.DARK_D4,
//               width: 1,
//             )),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//             borderSide: BorderSide(
//               color: ThemeColor.DARK_D4,
//               width: 1,
//             )),
//       ),
//       style: KLabelTextNormal12,
//       hint: hint,
//       value: value,
//       dropdownColor: dropdownColor,
//       iconSize: iconSize ?? 24.0,
//     );
//   }
// }

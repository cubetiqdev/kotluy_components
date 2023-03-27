// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_components/constant/colors/default_color.dart';

class CDropDown<T> extends StatelessWidget {
  final Widget? hint;
  final String? hintFieldText;
  final T? value;
  final Color? dropdownColor;
  final double? iconSize;
  final ValueChanged<T?> onChanged;
  final List<DropdownMenuItem<T>> items;
  final Icon? icon;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? textStyle;

  const CDropDown(
      {Key? key,
      this.iconSize,
      this.dropdownColor,
      required this.items,
      required this.onChanged,
      this.hint,
      this.hintFieldText,
      this.value,
      this.icon,
      this.contentPadding,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      onChanged: onChanged,
      items: items,
      icon: icon ??
          const Icon(Icons.keyboard_arrow_down_rounded,
              color: ThemeColor.DARK_Black),
      decoration: InputDecoration(
        contentPadding: contentPadding ?? const EdgeInsets.all(0),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      style: textStyle ?? TextStyle(fontSize: 20, color: Colors.black),
      hint: hint,
      value: value,
      dropdownColor: dropdownColor,
      iconSize: iconSize ?? 24.0,
    );
  }
}



// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_components/flutter_components.dart';

// class CDropDown<T> extends StatelessWidget {
//   final Widget? hint;
//   final String? hintFieldText;
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
//       this.hintFieldText,
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

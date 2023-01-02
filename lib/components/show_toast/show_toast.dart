// ignore_for_file: prefer_const_constructors

import 'package:component_sdk/components/text/custom_text_component.dart';
import 'package:component_sdk/constant/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

showToast(FToast? fToast, String? tile, {String fallBack = ""}) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(
      color: ThemeColor.LIGHT_L3,
      border: Border.all(width: 1, color: ThemeColor.SUCCESS_MAIN),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
              color: ThemeColor.SUCCESS_MAIN,
              borderRadius: BorderRadius.circular(20)),
          child: const Icon(
            Icons.check,
            size: 17,
            color: ThemeColor.LIGHT_WHITE,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: CTextCustoms(
            min: 12,
            text: "$tile",
            fallbackText: fallBack,
            style: TextStyle(color: ThemeColor.DARK_D1, fontSize: 13),
          ),
        ),
      ],
    ),
  );
  fToast?.showToast(
    child: toast,
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 5),
  );
}

void showMessageToast(
  FToast? fToast,
  String tile,
) {
  Widget toast = Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      constraints: BoxConstraints(
        maxHeight: 70.w,
        minWidth: 10.w,
      ),
      decoration: BoxDecoration(
        color: ThemeColor.PRIMARY_Subtle,
        borderRadius: BorderRadius.circular(30),
      ),
      child: CTextCustoms(
        min: 12,
        text: tile,
        style: TextStyle(color: ThemeColor.PRIMARY_MAIN),
        maxLines: 1,
      ));
  fToast?.showToast(
    child: toast,
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 5),
  );
}

void showToastError(FToast? fToast, String? tile,
    {String? fallBack, Map<String, String>? param}) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(
      color: ThemeColor.LIGHT_L3,
      border: Border.all(width: 1, color: ThemeColor.ERROR_MAIN),
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
              color: ThemeColor.ERROR_MAIN,
              borderRadius: BorderRadius.circular(20)),
          child: const Icon(
            Icons.info,
            size: 17,
            color: ThemeColor.LIGHT_WHITE,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: CTextCustoms(
            min: 12,
            text: tile ?? "",
            params: param,
            style: TextStyle(color: ThemeColor.DARK_D1, fontSize: 13),
            fallbackText: fallBack ?? "Oops!",
          ),
        ),
      ],
    ),
  );
  fToast?.showToast(
    child: toast,
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 5),
  );
}

// void showToastErrorTranslate(FToast? fToast, String tile,
//     {required BuildContext context}) {
//   Widget toast = Container(
//     height: 50,
//     decoration: BoxDecoration(
//         color: ThemeColor.LIGHT_WHITE,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             color: ThemeColor.ERROR_MAIN.withOpacity(0.09),
//             spreadRadius: 2,
//             blurRadius: 3,
//             offset: const Offset(0, 2),
//           )
//         ]),
//     child: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: 50,
//           height: 50,
//           decoration: const BoxDecoration(
//             color: ThemeColor.ERROR_MAIN,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(12),
//             child: SvgPicture.asset(
//               FileSVG.warring,
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Container(
//           width: 250,
//           color: Colors.transparent,
//           padding: EdgeInsets.symmetric(horizontal: 5),
//           child: CTextCustoms(
//               min: 12,
//               text: TranslateString.labelCallback(
//                   context, tile, 'Oops..!', {tile: 'Oops..!'}),
//               textAlign: TextAlign.left,
//               style: TextStyle(color: ThemeColor.DARK_D2, fontSize: 13)),
//         )
//       ],
//     ),
//   );
//   fToast?.showToast(
//     child: toast,
//     gravity: ToastGravity.TOP,
//     toastDuration: Duration(seconds: 5),
//   );
// }

void onTapExit(
  FToast? fToast,
  String tile,
) {
  Widget toast = Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: ThemeColor.ERROR_LIGHTER,
        borderRadius: BorderRadius.circular(30),
      ),
      child: CTextCustoms(
        min: 14,
        text: tile,
        style: TextStyle(color: ThemeColor.LIGHT_WHITE),
        maxLines: 1,
      ));
  fToast?.showToast(
    child: toast,
    toastDuration: Duration(seconds: 3),
    fadeDuration: Duration(seconds: 2),
    gravity: ToastGravity.BOTTOM,
  );
}

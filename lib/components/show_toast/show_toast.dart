// ignore_for_file: prefer_const_constructors

import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_components/extension/sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(FToast? fToast, String? tile) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(
      color: ThemeColor.LIGHT_L3,
      border: Border.all(width: 1, color: ThemeColor.SUCCESS),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
              color: ThemeColor.SUCCESS,
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
          child: Text(
            "$tile",
            style: TextStyle(color: ThemeColor.DARK_D1, fontSize: 13),
          ),
        ),
      ],
    ),
  );
  return fToast?.showToast(
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
      child: Text(
        tile,
        style: TextStyle(color: ThemeColor.PRIMARY_MAIN),
        maxLines: 1,
      ));
  return fToast?.showToast(
    child: toast,
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 5),
  );
}

void showToastError(
  FToast? fToast,
  String? tile,
) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(
      color: ThemeColor.LIGHT_L3,
      border: Border.all(width: 1, color: ThemeColor.ERROR),
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
              color: ThemeColor.ERROR, borderRadius: BorderRadius.circular(20)),
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
          child: Text(
            tile ?? "",
            style: TextStyle(color: ThemeColor.DARK_D1, fontSize: 13),
          ),
        ),
      ],
    ),
  );
  return fToast?.showToast(
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
//             color: ThemeColor.ERROR.withOpacity(0.09),
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
//             color: ThemeColor.ERROR,
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
        color: ThemeColor.ERROR,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        tile,
        style: TextStyle(color: ThemeColor.LIGHT_WHITE),
        maxLines: 1,
      ));
  return fToast?.showToast(
    child: toast,
    toastDuration: Duration(seconds: 3),
    fadeDuration: Duration(seconds: 2),
    gravity: ToastGravity.BOTTOM,
  );
}

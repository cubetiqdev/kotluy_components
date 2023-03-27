// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter_components/components/profile_image/profile_image.dart';
import 'package:flutter_components/constant/colors/color.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_components/extension/sizer.dart';

class LanguageWithFlags extends StatelessWidget {
  final String? language;
  final String countryFlags;
  final Color? color;
  final Color? textColor;
  final double padHorizontal;
  final double padVertical;
  final bool? select;

  const LanguageWithFlags({
    this.language,
    required this.countryFlags,
    this.color,
    this.textColor,
    this.padHorizontal = 20,
    this.padVertical = 0,
    this.select = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padHorizontal, vertical: padVertical),
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        decoration: BoxDecoration(
          color: color ?? ThemeColor.LIGHT_WHITE,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ThemeColor.DARK_D2.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 5), // changes position of shadow
            )
          ],
        ),
        child: Center(
          child: ListTile(
            leading: ProfileImageCustom(
              assetImage: countryFlags,
              imageHeight: 10.w,
              imageWidth: 15.w,
              borderRadius: 0,
            ),
            title: Text(
              language ?? "",
              style: KLabelTextSemiBold14.copyWith(
                  color: textColor ?? ThemeColor.DARK_D1),
            ),
            trailing: select == true
                ? Icon(
                    Icons.check_circle,
                    color: ThemeColor.SUCCESS,
                  )
                : SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

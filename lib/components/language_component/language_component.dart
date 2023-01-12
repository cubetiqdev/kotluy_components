// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:component_sdk/components/profile_image/profile_image.dart';
import 'package:component_sdk/constant/colors/color.dart';
import 'package:component_sdk/constant/fonts/default_font.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../components/text/custom_text_component.dart';

class LanguageWithFlags extends StatelessWidget {
  final String? language;
  final String? countryFlags;
  final bool? select;

  const LanguageWithFlags(
      {this.language, this.countryFlags, this.select = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        decoration: BoxDecoration(
          color: ThemeColor.LIGHT_WHITE,
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
              urlImage: countryFlags,
              imageHeight: 10.w,
              imageWidth: 15.w,
              borderRadius: 0,
            ),
            title: CTextCustoms(
              min: 12,
              text: language ?? "",
              fallbackText: language,
              style: KLabelTextDemiBold14.copyWith(color: ThemeColor.DARK_D1),
            ),
            trailing: select == true
                ? Icon(
                    Icons.check_circle,
                    color: ThemeColor.SUCCESS_MAIN,
                  )
                : SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CTextCustoms extends StatelessWidget {
  final bool? softWrap;
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? min;
  final double? max;
  // allow to use translate for the text above.
  final bool t;
  final String? fallbackText;
  final Map<String, String>? params;

  const CTextCustoms({
    this.text = "",
    this.style,
    this.textAlign,
    this.min,
    this.max,
    this.maxLines,
    this.overflow,
    this.t = true,
    this.fallbackText,
    this.params,
    this.softWrap,
  });
  String fallBackText(BuildContext context, String text, String? fallBack,
      Map<String, String>? param) {
    try {
      // return FlutterI18n.translate(context, text,
      //     fallbackKey: fallBack, translationParams: param);
      return '';
    } catch (error) {
      return fallBack ?? text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      t ? fallBackText(context, text, fallbackText, params) : text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }
}

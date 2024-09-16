// ignore_for_file: prefer_const_constructors_in_immutables, unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';
import 'package:flutter_components/extension/screen_util.dart';

enum ButtonState { init, loading, done }

class AnimationProgressButton extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final ButtonState state;
  final VoidCallback? onPressed;
  final double? width;
  final double padHorizontal;
  final double padVertical;
  final double? height;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? loadingColor;
  final Color? doneColor;
  final BorderRadius? borderRadius;
  final double? iconSize;
  final bool? noInternet;
  final Widget? child;

  AnimationProgressButton({
    super.key,
    required this.title,
    this.textStyle,
    this.state = ButtonState.init,
    this.onPressed,
    this.width,
    this.padHorizontal = 20.0,
    this.padVertical = 10.0,
    this.height,
    this.backgroundColor,
    this.borderColor,
    this.loadingColor,
    this.doneColor,
    this.borderRadius,
    this.iconSize,
    this.noInternet,
    this.child,
  });

  bool get isDone => this.state == ButtonState.done;

  bool get isNotInit => this.state != ButtonState.init;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return IgnorePointer(
      ignoring: noInternet == true ? true : false,
      child: InkWell(
        onTap: state == ButtonState.loading || state == ButtonState.done
            ? null
            : onPressed,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: padHorizontal, vertical: padVertical),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
            width: state == ButtonState.init ? this.width ?? width : 100.w,
            height: height ?? 57.h,
            child: isNotInit
                ? buildSmallButton(
                    isDone, loadingColor, doneColor, iconSize ?? 30.0)
                : buildButton(
                    title,
                    backgroundColor,
                    borderColor,
                    textStyle,
                    noInternet ?? false,
                    child: child,
                    borderRadius: borderRadius,
                    onPressed: state == ButtonState.loading ||
                            state == ButtonState.done
                        ? null
                        : onPressed,
                  ),
          ),
        ),
      ),
    );
  }
}

Widget buildSmallButton(
    bool isDone, Color? loadingColor, Color? doneColor, double iconSize) {
  final colors = isDone
      ? doneColor ?? Color(0xff34B67F)
      : loadingColor ?? Color(0xff34B67F);
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: colors,
    ),
    child: Center(
      child: isDone
          ? Icon(
              Icons.done_rounded,
              size: iconSize,
              color: Colors.white,
            )
          : CircularProgressIndicator(
              color: Colors.white,
            ),
    ),
  );
}

Widget buildButton(String title, Color? backgroundColor, Color? borderColor,
        TextStyle? textStyle, bool noInternet,
        {Widget? child, BorderRadius? borderRadius, VoidCallback? onPressed}) =>
    OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: noInternet == true
            ? ThemeColor.DIS_BUTTON
            : backgroundColor ?? ThemeColor.PRIMARY_MAIN,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(50.0.r),
        ),
        side: BorderSide(
          width: 1.w,
          color: noInternet == true
              ? ThemeColor.DIS_BUTTON
              : borderColor ?? ThemeColor.PRIMARY_MAIN,
        ),
      ),
      child: child ??
          InkWell(
            onTap: onPressed,
            child: Text(
              style: textStyle ??
                  KLabelTextBold16.copyWith(
                      color: Colors.white, fontSize: 16.sp),
              title,
              textAlign: TextAlign.center,
            ),
          ),
    );

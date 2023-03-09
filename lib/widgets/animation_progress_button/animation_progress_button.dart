// ignore_for_file: prefer_const_constructors_in_immutables, unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_components/constant/colors/color.dart';

enum ButtonState { init, loading, done }

class AnimationProgressButton extends StatelessWidget {
  final ButtonState state;
  final VoidCallback onPressed;
  final double? width;
  final String title;
  final double padHorizontal;
  final double padVertical;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? loadingColor;
  final Color? doneColor;
  final TextStyle? textStyle;
  final double? height;
  AnimationProgressButton({
    this.state = ButtonState.init,
    required this.title,
    this.width,
    this.padHorizontal = 20.0,
    this.padVertical = 10.0,
    required this.onPressed,
    Key? key,
    this.backgroundColor,
    this.borderColor,
    this.textStyle,
    this.height,
    this.loadingColor,
    this.doneColor,
  }) : super(key: key);

  bool get isDone => this.state == ButtonState.done;

  bool get isNotInit => this.state != ButtonState.init;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          horizontal: padHorizontal, vertical: padVertical),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        width: state == ButtonState.init ? this.width ?? width : 100,
        height: height ?? 57,
        child: isNotInit
            ? buildSmallButton(isDone, loadingColor, doneColor)
            : buildButton(
                title,
                onPressed,
                backgroundColor,
                borderColor,
                textStyle,
              ),
      ),
    );
  }
}

Widget buildSmallButton(bool isDone, Color? loadingColor, Color? doneColor) {
  final colors = isDone
      ? doneColor ?? Colors.green
      : loadingColor ?? ThemeColor.PRIMARY_MAIN;
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: colors,
    ),
    child: Center(
      child: isDone
          ? Icon(
              Icons.done,
              size: 40,
              color: Colors.white,
            )
          : CircularProgressIndicator(
              color: Colors.white,
            ),
    ),
  );
}

Widget buildButton(String title, VoidCallback onPressed, Color? backgroundColor,
        Color? borderColor, TextStyle? textStyle) =>
    OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor ?? ThemeColor.PRIMARY_MAIN,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        side: BorderSide(
          width: 1,
          color: borderColor ?? ThemeColor.PRIMARY_MAIN,
        ),
      ),
      child: Text(
        style: textStyle ??
            TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
              fontSize: 14,
              letterSpacing: 0.5,
              color: Colors.white,
            ),
        title,
        textAlign: TextAlign.center,
      ),
    );

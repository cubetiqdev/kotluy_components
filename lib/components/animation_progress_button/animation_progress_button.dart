// ignore_for_file: prefer_const_constructors_in_immutables, unnecessary_this, prefer_const_constructors

import 'package:flutter/material.dart';

enum ButtonState { init, loading, done }

class AnimationProgressButton extends StatelessWidget {
  final ButtonState state;
  final VoidCallback onPressed;
  final double? width;
  final String title;
  final String fieldText;
  final double padHorizontal;
  final double padVertical;
  AnimationProgressButton({
    this.state = ButtonState.init,
    required this.title,
    required this.fieldText,
    this.width,
    this.padHorizontal = 15.0,
    this.padVertical = 10.0,
    required this.onPressed,
    Key? key,
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
        height: 57,
        child: isNotInit
            ? buildSmallButton(isDone)
            : buildButton(
                title,
                fieldText,
                onPressed,
              ),
      ),
    );
  }
}

Widget buildSmallButton(bool isDone) {
  final colors = isDone ? Colors.green : Color(0xffEF4748);
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

Widget buildButton(String title, String field, VoidCallback onPressed) =>
    OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xffEF4748),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        side: BorderSide(
          width: 1,
          color: const Color(0xffEF4748),
        ),
      ),
      child: Text(
        style: TextStyle(
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

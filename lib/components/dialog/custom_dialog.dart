import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:flutter/material.dart';

class DialogWarning extends StatelessWidget {
  final Color warningBorderColor;
  final String? titleText;
  final String? content;
  final Color? backgroundColor;
  final double borderRadius;
  final Color? contentTextColor;
  final Color titleTextColor;
  final VoidCallback? onTap;

  const DialogWarning(
      {super.key,
      this.warningBorderColor = ThemeColor.WARNING,
      this.onTap,
      this.titleText,
      this.content,
      this.backgroundColor,
      this.borderRadius = 20.0,
      this.contentTextColor,
      this.titleTextColor = ThemeColor.WARNING});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: warningBorderColor,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      backgroundColor: backgroundColor ?? Colors.grey.shade200,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 100, color: ThemeColor.WARNING),
          const SizedBox(height: 5),
          Text(
            titleText ?? "Warning",
            style: TextStyle(
              color: titleTextColor,
            ),
          ),
        ],
      ),
      content: Builder(
        builder: (context) {
          return Text(
            content ?? "Enter Your Content.",
            style: TextStyle(
              color: contentTextColor ?? ThemeColor.DARK_Black,
            ),
          );
        },
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DialogButton(
              title: "Cancel",
              textColor: ThemeColor.DARK_Black,
              width: 80,
              height: 35,
              color: ThemeColor.WARNING,
              radius: 30.0,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            DialogButton(
              title: "Okay",
              textColor: ThemeColor.DARK_Black,
              width: 80,
              height: 35,
              radius: 30.0,
              color: ThemeColor.WARNING,
              onTap: () {
                onTap;
              },
            )
          ],
        )
      ],
    );
  }
}

class DialogError extends StatelessWidget {
  final String? titleText;
  final String? content;
  final Color? backgroundColor;
  final double borderRadius;
  final Color? contentTextColor;
  final Color titleTextColor;
  final Color errorBorderColor;

  const DialogError(
      {super.key,
      this.errorBorderColor = ThemeColor.ERROR,
      this.titleText,
      this.content,
      this.backgroundColor,
      this.borderRadius = 20.0,
      this.contentTextColor,
      this.titleTextColor = ThemeColor.ERROR});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: errorBorderColor,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      backgroundColor: backgroundColor ?? Colors.grey.shade200,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 100,
            color: ThemeColor.ERROR,
          ),
          const SizedBox(height: 5),
          Text(
            titleText ?? "Error!",
            style: TextStyle(
              color: titleTextColor,
            ),
          ),
        ],
      ),
      content: Builder(
        builder: (context) {
          return Text(
            content ?? "Enter Your Content.",
            style: TextStyle(
              color: contentTextColor ?? ThemeColor.DARK_Black,
            ),
          );
        },
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DialogButton(
              title: "Okay",
              textColor: ThemeColor.DARK_Black,
              width: 80,
              height: 35,
              radius: 30.0,
              color: ThemeColor.ERROR,
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        )
      ],
    );
  }
}

class DialogSuccess extends StatelessWidget {
  final Color successBorderColor;
  final String? titleText;
  final String? content;
  final Color? backgroundColor;
  final double borderRadius;
  final Color? contentTextColor;
  final Color titleTextColor;

  const DialogSuccess(
      {super.key,
      this.successBorderColor = ThemeColor.SUCCESS,
      this.titleText,
      this.content,
      this.backgroundColor,
      this.borderRadius = 20.0,
      this.contentTextColor,
      this.titleTextColor = ThemeColor.SUCCESS});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: successBorderColor,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      backgroundColor: backgroundColor ?? Colors.grey.shade200,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 100,
            color: ThemeColor.SUCCESS,
          ),
          const SizedBox(height: 5),
          Text(
            titleText ?? "Success",
            style: TextStyle(
              color: titleTextColor,
            ),
          ),
        ],
      ),
      content: Builder(
        builder: (context) {
          return Text(
            content ?? "Enter Your Content.",
            style: TextStyle(
              color: contentTextColor ?? ThemeColor.DARK_Black,
            ),
          );
        },
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DialogButton(
              title: "Okay",
              textColor: ThemeColor.DARK_Black,
              width: 80,
              height: 35,
              radius: 30.0,
              color: ThemeColor.SUCCESS,
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        )
      ],
    );
  }
}

class DialogButton extends StatelessWidget {
  final Color? textColor;
  final Color? color;
  final String title;
  final double? width;
  final double? height;
  final bool isLoading;
  final GestureTapCallback? onTap;
  final double radius;
  const DialogButton(
      {super.key,
      this.onTap,
      this.textColor,
      this.isLoading = false,
      this.color,
      required this.title,
      this.width = 277,
      this.height = 44,
      this.radius = 10.0});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: color,
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.red,
              )
            : Text(
                title,
                style: TextStyle(
                  color: textColor,
                ),
              ),
      ),
    );
  }
}

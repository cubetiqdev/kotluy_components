import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final double? paddingInside;
  final double? imageHeight;
  final double? imageWidth;
  final Color? backgroundColor;
  final Color? borderColor;

  const SquareTile({
    super.key,
    required this.imagePath,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.paddingInside,
    this.imageHeight,
    this.imageWidth,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(paddingInside ?? 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? Colors.grey.shade600,
          ),
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor ?? Colors.grey.shade200,
        ),
        child: Image.asset(
          imagePath,
          width: imageWidth,
          height: imageHeight ?? 3.h,
        ),
      ),
    );
  }
}

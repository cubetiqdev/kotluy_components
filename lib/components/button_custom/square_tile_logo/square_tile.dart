import 'package:flutter/material.dart';
import 'package:flutter_components/extension/screen_util.dart';
class SquareTile extends StatelessWidget {
  final String imagePath;
  final void Function()? onTap;
  final double? imageHeight;
  final double? imageWidth;
  final Color? borderColor;
  final Color? backgroundColor;
  const SquareTile({
    super.key,
    required this.imagePath,
    this.onTap,
    this.imageHeight,
    this.imageWidth,
    this.borderColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? Colors.grey.shade600,
          ),
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor ?? Colors.grey.shade200,
        ),
        child: Image.asset(
          imagePath,
          height: imageHeight ?? 3.h,
          width: imageWidth,
        ),
      ),
    );
  }
}

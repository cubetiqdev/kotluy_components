import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final void Function()? onTap;
  final double? imageHeight;
  final double? imageWidth;
  const SquareTile({
    super.key,
    required this.imagePath,
    this.onTap,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade600,
          ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade200,
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

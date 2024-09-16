import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  const DashLine({
    super.key,
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width ?? 5.0;
        final dashHeight = height ?? 1.0;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color ?? Colors.black),
              ),
            );
          }),
        );
      },
    );
  }
}

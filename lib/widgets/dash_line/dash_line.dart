// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  final double? width;
  final double? height;
  final double padHorizontal;
  final double padVertical;
  final Color? color;
  const DashLine({
    Key? key,
    this.height,
    this.width,
    this.padHorizontal = 20,
    this.padVertical = 0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: padHorizontal, vertical: padVertical),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          final dashWidth = width ?? 5.0;
          final dashHeight = height ?? 1.0;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color ?? Colors.black),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          );
        },
      ),
    );
  }
}

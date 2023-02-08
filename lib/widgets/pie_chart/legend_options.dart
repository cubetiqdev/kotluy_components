import 'package:component_sdk/widgets/pie_chart/pie_chart.dart';
import 'package:component_sdk/widgets/pie_chart/utils.dart';
import 'package:flutter/material.dart';

class LegendOptions {
  final bool showLegends;
  final bool showLegendsInRow;
  final TextStyle legendTextStyle;
  final BoxShape legendShape;
  final LegendPosition legendPosition;
  final Map<String, String> legendLabels;

  const LegendOptions({
    this.showLegends = true,
    this.showLegendsInRow = false,
    this.legendTextStyle = defaultLegendStyle,
    this.legendShape = BoxShape.circle,
    this.legendPosition = LegendPosition.right,
    this.legendLabels = const {},
  });
}

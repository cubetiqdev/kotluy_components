import 'package:flutter/material.dart';

class CircleBottomBarModel {
  Color? backgroundColor;
  double? elevation;
  List<Color>? circleColors;
  IconThemeData? activeIconTheme;
  IconThemeData? iconTheme;
  TextStyle? activeTitleStyle;
  TextStyle? titleStyle;
  List<BarItem?> items;
  List<CircleItem> circleItems;
  CircleActionBottonModel? actionButtonDetails;
  double? height;

  CircleBottomBarModel(
      {required this.items,
      required this.circleItems,
      this.height,
      this.actionButtonDetails,
      this.activeIconTheme,
      this.iconTheme,
      this.activeTitleStyle,
      this.titleStyle,
      this.circleColors,
      this.backgroundColor,
      this.elevation});
}

class CircleActionBottonModel {
  Color color;
  Icon icon;
  double elevation;

  CircleActionBottonModel(
      {required this.color, required this.icon, required this.elevation});
}

class CircleItem {
  Icon icon;
  void Function() onPressed;
  Text text;

  CircleItem({required this.icon, required this.onPressed, required this.text});
}

class BarItem {
  IconData? activeIcon;
  IconData icon;
  String? title;
  Function onPressed;

  BarItem(
      {this.activeIcon,
      required this.icon,
      this.title,
      required this.onPressed});
}

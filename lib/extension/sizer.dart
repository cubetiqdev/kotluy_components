import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension Size on num {
  /// Eg: 10.h -> will take 10% of the screen's height
  double get h => this * DeviceUtil.height / 100;

  /// Eg: 10.h -> will take 10% of the screen's height
  double get w => this * DeviceUtil.width / 100;

  double get sp => this * (DeviceUtil.width / 3) / 100;
}

typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);

  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        DeviceUtil.setScreenSize(constraints, orientation);
        return builder(context, orientation, DeviceUtil.deviceType);
      });
    });
  }
}

class DeviceUtil {
  static late double height;
  static late double width;
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;

  static void setScreenSize(
      BoxConstraints constraints, Orientation currentOrientation) {
    boxConstraints = constraints;
    orientation = currentOrientation;
    if (orientation == Orientation.portrait || kIsWeb) {
      width = boxConstraints.maxWidth;
      height = boxConstraints.maxHeight;
    } else {
      width = boxConstraints.maxHeight;
      height = boxConstraints.maxWidth;
    }
    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else if (Platform.isAndroid || Platform.isIOS) {
      if ((orientation == Orientation.portrait && width < 600) ||
          (orientation == Orientation.landscape && height < 600)) {
        deviceType = DeviceType.mobile;
      } else {
        deviceType = DeviceType.tablet;
      }
    } else if (Platform.isMacOS) {
      deviceType = DeviceType.mac;
    } else if (Platform.isWindows) {
      deviceType = DeviceType.windows;
    } else if (Platform.isLinux) {
      deviceType = DeviceType.linux;
    } else {
      deviceType = DeviceType.fuchsia;
    }
  }
}

enum DeviceType { mobile, tablet, web, mac, windows, linux, fuchsia }

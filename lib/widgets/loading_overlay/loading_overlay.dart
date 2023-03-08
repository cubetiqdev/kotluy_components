// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class LoadingOverlay extends StatefulWidget {
  final double? height;
  final double? width;
  final Widget? loading;
  const LoadingOverlay(
      {Key? key, required this.child, this.height, this.width, this.loading})
      : super(key: key);

  final Widget child;

  static LoadingOverlayState of(BuildContext context) {
    return context.findAncestorStateOfType<LoadingOverlayState>()!;
  }

  @override
  State<LoadingOverlay> createState() => LoadingOverlayState();
}

class LoadingOverlayState extends State<LoadingOverlay> {
  bool _isLoading = false;

  void show() {
    setState(() {
      _isLoading = true;
    });
  }

  void hide() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_isLoading)
          const Opacity(
            opacity: 0.5,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (_isLoading)
          Center(
            child: SizedBox(
              width: widget.width ?? 30.w,
              height: widget.height ?? 30.h,
              child: widget.loading ??
                  Lottie.asset('assets/animations/loading.json'),
            ),
          ),
      ],
    );
  }
}

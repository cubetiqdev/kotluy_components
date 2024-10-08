import 'package:flutter/material.dart';
import 'package:flutter_components/extension/screen_util.dart';
import 'package:lottie/lottie.dart';

class LoadingOverlay extends StatefulWidget {
  final double? height;
  final double? width;
  final Widget? loading;
  const LoadingOverlay(
      {super.key, required this.child, this.height, this.width, this.loading});

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
              width: widget.width ?? 100.w,
              height: widget.height ?? 100.h,
              child: widget.loading ??
                  Lottie.asset('assets/animations/loading.json'),
            ),
          ),
      ],
    );
  }
}

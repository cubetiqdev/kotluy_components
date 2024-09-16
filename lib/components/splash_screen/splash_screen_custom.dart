// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math' as math show sin, pi;

class SplashScreenCustom extends StatefulWidget {
  const SplashScreenCustom(
      {super.key,
      required this.url,
      this.imageHeight,
      this.imageWidth,
      this.title,
      this.loadingColor,
      this.loadingSize,
      this.controller,
      this.loadingDuration,
      this.itemBuilder});

  final String? url;
  final double? imageHeight;
  final double? imageWidth;
  final Text? title;
  final Color? loadingColor;
  final double? loadingSize;
  final AnimationController? controller;
  final Duration? loadingDuration;
  final Widget Function(BuildContext, int)? itemBuilder;

  @override
  State<SplashScreenCustom> createState() => _SplashScreenCustomState();
}

class _SplashScreenCustomState extends State<SplashScreenCustom> {
  double customTitleOpacity = 0;
  double customLoadingOpacity = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TweenAnimationBuilder(
            onEnd: () {
              setState(() {
                customTitleOpacity = 1;
              });
            },
            curve: Curves.bounceOut,
            tween: Tween<double>(begin: 30, end: 100),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) {
              return Image.network(
                widget.url!,
                width: widget.imageWidth,
                height: widget.imageHeight,
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedOpacity(
            duration: const Duration(seconds: 1),
            onEnd: () {
              setState(() {
                customLoadingOpacity = 1;
              });
            },
            opacity: customTitleOpacity,
            child: widget.title ?? const SizedBox.shrink(),
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: customLoadingOpacity,
              child: SpinKitFadingCircle(
                color: widget.loadingColor ?? Colors.blue,
                size: widget.loadingSize ?? 50,
                controller: widget.controller,
                duration: widget.loadingDuration ??
                    const Duration(milliseconds: 1200),
                itemBuilder: widget.itemBuilder,
              )),
        ],
      ),
    );
  }
}

class SpinKitFadingCircle extends StatefulWidget {
  const SpinKitFadingCircle({
    super.key,
    required this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 1200),
    this.controller,
  })  : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color');

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  _SpinKitFadingCircleState createState() => _SpinKitFadingCircleState();
}

class _SpinKitFadingCircleState extends State<SpinKitFadingCircle>
    with SingleTickerProviderStateMixin {
  final List<double> delays = [
    .0,
    -1.1,
    -1.0,
    -0.9,
    -0.8,
    -0.7,
    -0.6,
    -0.5,
    -0.4,
    -0.3,
    -0.2,
    -0.1
  ];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(12, (i) {
            final position = widget.size * .5;
            return Positioned.fill(
              left: position,
              top: position,
              child: Transform(
                transform: Matrix4.rotationZ(30.0 * i * 0.0174533),
                child: Align(
                  alignment: Alignment.center,
                  child: FadeTransition(
                    opacity: DelayTween(begin: 0.0, end: 1.0, delay: delays[i])
                        .animate(_controller),
                    child: SizedBox.fromSize(
                        size: Size.square(widget.size * 0.15),
                        child: _itemBuilder(i)),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle));
}

class DelayTween extends Tween<double> {
  DelayTween({super.begin, super.end, required this.delay});

  final double delay;

  @override
  double lerp(double t) =>
      super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

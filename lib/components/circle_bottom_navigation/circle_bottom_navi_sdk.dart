// ignore_for_file: library_private_types_in_public_api

library circle_bottom_navi_sdk;

import 'package:component_sdk/components/circle_bottom_navigation/model.dart';
import 'package:flutter/material.dart';

class CircleBottomNavigation extends StatefulWidget {
  final CircleBottomBarModel bottomBarModel;

  const CircleBottomNavigation({Key? key, required this.bottomBarModel})
      : super(key: key);

  @override
  _SpinCircleBottomBarState createState() => _SpinCircleBottomBarState();
}

enum ExpansionStatus { open, close, idle }

class _SpinCircleBottomBarState extends State<CircleBottomNavigation> {
  ExpansionStatus expansionStatus = ExpansionStatus.idle;
  late CircleBottomBarModel expandableBottomBarDetails;
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();

    expandableBottomBarDetails = widget.bottomBarModel;
    expandableBottomBarDetails.items
        .insert((expandableBottomBarDetails.items.length / 2).floor(), null);
    expandableBottomBarDetails.circleColors =
        expandableBottomBarDetails.circleColors ??
            [Colors.white, Colors.blue, Colors.red];
    expandableBottomBarDetails.actionButtonDetails =
        expandableBottomBarDetails.actionButtonDetails ??
            CircleActionBottonModel(
                color: Colors.blue,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                elevation: 0);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final double bottomBarHeight = expandableBottomBarDetails.height ?? 80;
    final IconThemeData iconTheme = expandableBottomBarDetails.iconTheme ??
        const IconThemeData(color: Colors.black45);
    final IconThemeData activeIconTheme =
        expandableBottomBarDetails.activeIconTheme ??
            const IconThemeData(color: Colors.black);
    final TextStyle textStyle = expandableBottomBarDetails.titleStyle ??
        const TextStyle(
            color: Colors.black45, fontWeight: FontWeight.normal, fontSize: 12);
    final TextStyle activeTextStyle =
        expandableBottomBarDetails.activeTitleStyle ??
            const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12);
    final CircleActionBottonModel? actionButtonDetails =
        expandableBottomBarDetails.actionButtonDetails;

    final bool shouldOpen = expansionStatus == ExpansionStatus.open;
    return Container(
        height: bottomBarHeight * 2,
        width: width,
        alignment: Alignment.center,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: bottomBarHeight,
                width: width,
                decoration: BoxDecoration(
                    color: expandableBottomBarDetails.backgroundColor ??
                        Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withAlpha(55),
                          offset: Offset(
                              0, expandableBottomBarDetails.elevation ?? 0),
                          blurRadius: 10)
                    ]),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: expandableBottomBarDetails.items
                          .asMap()
                          .entries
                          .map((entry) {
                        final int index = entry.key;
                        final BarItem? itemDetails = entry.value;
                        final bool isActive = activeIndex == index;
                        return Flexible(
                            child: itemDetails != null
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        activeIndex = index;
                                      });
                                      itemDetails.onPressed();
                                    },
                                    child: Center(
                                      child: Container(
                                        color: Colors.white.withOpacity(0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Icon(
                                                isActive
                                                    ? itemDetails.activeIcon ??
                                                        itemDetails.icon
                                                    : itemDetails.icon,
                                                color: isActive
                                                    ? activeIconTheme.color
                                                    : iconTheme.color,
                                                size: isActive
                                                    ? activeIconTheme.size
                                                    : iconTheme.size,
                                              ),
                                            ),
                                            itemDetails.title != null
                                                ? Text(itemDetails.title ?? "",
                                                    style: isActive
                                                        ? activeTextStyle
                                                        : textStyle)
                                                : const Center()
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : const Center());
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            if (expansionStatus != ExpansionStatus.idle) ...[
              Positioned(
                top: 0,
                child: SizedBox(
                    width: width,
                    height: bottomBarHeight * 3,
                    child: Stack(
                      children: <Widget>[
                        TweenAnimationBuilder(
                          tween: Tween<double>(
                              begin: shouldOpen ? -3.14 : 0,
                              end: shouldOpen ? 0 : -3.14),
                          curve: Curves.easeInOutQuad,
                          duration:
                              Duration(milliseconds: shouldOpen ? 500 : 800),
                          builder: (BuildContext context, double value,
                              Widget? child) {
                            return Transform.rotate(
                              angle: value,
                              alignment: Alignment.bottomCenter,
                              child: child,
                            );
                          },
                          child: shouldOpen
                              ? AnimatedOpacity(
                                  duration: Duration(seconds: 0),
                                  curve: Curves.easeIn,
                                  opacity: 1,
                                  child: EmptyLayer(
                                    radius: bottomBarHeight * 3,
                                    color: expandableBottomBarDetails
                                        .circleColors![2],
                                  ),
                                )
                              : AnimatedOpacity(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeOut,
                                  opacity: 0,
                                  child: EmptyLayer(
                                    radius: bottomBarHeight * 3,
                                    color: expandableBottomBarDetails
                                        .circleColors![2],
                                  ),
                                ),
                        ),
                        TweenAnimationBuilder(
                          tween: Tween<double>(
                              begin: shouldOpen ? -3.14 : 0,
                              end: shouldOpen ? 0 : -3.14),
                          curve: Curves.easeInOutQuad,
                          duration: const Duration(milliseconds: 600),
                          builder: (BuildContext context, double value,
                              Widget? child) {
                            return Transform.rotate(
                              angle: value,
                              alignment: Alignment.bottomCenter,
                              child: child,
                            );
                          },
                          child: shouldOpen
                              ? AnimatedOpacity(
                                  duration: Duration(seconds: 0),
                                  curve: Curves.easeIn,
                                  opacity: 1,
                                  child: EmptyLayer(
                                    radius: bottomBarHeight * 3,
                                    color: expandableBottomBarDetails
                                        .circleColors![1],
                                  ),
                                )
                              : AnimatedOpacity(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeOut,
                                  opacity: 0,
                                  child: EmptyLayer(
                                    radius: bottomBarHeight * 3,
                                    color: expandableBottomBarDetails
                                        .circleColors![1],
                                  ),
                                ),
                        ),
                        TweenAnimationBuilder(
                          tween: Tween<double>(
                              begin: shouldOpen ? -3.14 : 0,
                              end: shouldOpen ? 0 : -3.14),
                          duration:
                              Duration(milliseconds: shouldOpen ? 800 : 500),
                          curve: Curves.easeInOutQuad,
                          builder: (BuildContext context, double value,
                              Widget? child) {
                            return Transform.rotate(
                              angle: value,
                              alignment: Alignment.bottomCenter,
                              child: child,
                            );
                          },
                          child: shouldOpen
                              ? AnimatedOpacity(
                                  duration: Duration(seconds: 0),
                                  curve: Curves.easeIn,
                                  opacity: 1,
                                  child: PrimaryCircle(
                                    circleItems:
                                        expandableBottomBarDetails.circleItems,
                                    radius: bottomBarHeight * 3,
                                    color: expandableBottomBarDetails
                                        .circleColors![0],
                                  ),
                                )
                              : AnimatedOpacity(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeOut,
                                  opacity: 0,
                                  child: PrimaryCircle(
                                    circleItems:
                                        expandableBottomBarDetails.circleItems,
                                    radius: bottomBarHeight * 3,
                                    color: expandableBottomBarDetails
                                        .circleColors![0],
                                  ),
                                ),
                        ),
                      ],
                    )),
              )
            ],
            Positioned(
              top: 40,
              child: Container(
                  height: bottomBarHeight * 2,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(
                        begin: shouldOpen ? 0.0 : 6.28319,
                        end: shouldOpen ? 6.28319 : 0),
                    duration: const Duration(milliseconds: 250),
                    builder:
                        (BuildContext context, double angle, Widget? child) {
                      return Transform.rotate(
                          angle: expansionStatus == ExpansionStatus.idle
                              ? 0.0
                              : angle,
                          child: child);
                    },
                    child: FloatingActionButton(
                        elevation: actionButtonDetails!.elevation,
                        backgroundColor: actionButtonDetails.color,
                        onPressed: () {
                          if (expansionStatus == ExpansionStatus.idle) {
                            setState(() {
                              expansionStatus = ExpansionStatus.open;
                            });
                          } else {
                            setState(() {
                              expansionStatus =
                                  (expansionStatus == ExpansionStatus.open)
                                      ? ExpansionStatus.close
                                      : ExpansionStatus.open;
                            });
                          }
                        },
                        child: shouldOpen
                            ? const Icon(Icons.close)
                            : actionButtonDetails.icon),
                  )),
            ),
          ],
        ));
  }
}

class PrimaryCircle extends StatelessWidget {
  final List<CircleItem> circleItems;
  final Color color;
  final double radius;

  const PrimaryCircle(
      {Key? key,
      required this.color,
      required this.radius,
      required this.circleItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double radianGap = 3.14159 / circleItems.length;
    final double start = radianGap / 2;
    return ClipPath(
      clipper: ClipPathClass(),
      child: Align(
        heightFactor: 0.5,
        alignment: Alignment.topCenter,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: circleItems.asMap().entries.map((entry) {
                final CircleItem value = entry.value;
                return Transform.translate(
                    offset: Offset.fromDirection(
                        -(start + (entry.key * radianGap)), radius / 4),
                    child: GestureDetector(
                      onTap: value.onPressed,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Column(
                          children: [
                            // Transform.translate(
                            //     offset: Offset.fromDirection(300, 0),
                            //     child: Container(
                            //         color: Colors.red,
                            //         child: Padding(
                            //           padding: const EdgeInsets.symmetric(
                            //               horizontal: 8.0),
                            //           child: value.text,
                            //         ))),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              height: 20,
                            ),
                            value.icon,
                          ],
                        ),
                      ),
                    ));
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyLayer extends StatelessWidget {
  final Color color;
  final double radius;

  const EmptyLayer({Key? key, required this.color, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipPathClass(),
      child: Align(
        heightFactor: 0.5,
        alignment: Alignment.topCenter,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: const Center(),
        ),
      ),
    );
  }
}

// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path()
//       ..lineTo(0, 0)
//       ..lineTo(50, 100)
//       ..lineTo(size.width, size.height * .5)
//       ..lineTo(size.width, size.height * .5);

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
// }

class Sky extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double h = size.height;
    double w = size.width;

    double xOffset = 0.1;
    Path path = Path()
      ..lineTo(w * xOffset, h)
      ..lineTo(w - w * xOffset, h)
      ..lineTo(w, h / 2)
      ..lineTo(w - w * xOffset, 0)
      ..lineTo(w * xOffset, 0.0)
      ..lineTo(0.0, h / 2)
      ..lineTo(w * xOffset, h);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class ClipPathClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2.1, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

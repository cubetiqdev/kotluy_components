// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:test/components/buttons/button.dart';
// import 'package:test/components/components.dart';

// void main() => runApp(const MyWidget());

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Components(),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'dart:math' as math;

import 'package:flutter/material.dart';

const double degrees2Radians = math.pi / 100.0;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final items = [
    ButtonData(title: 'one', onTap: () => print('1')),
    ButtonData(title: 'two', onTap: () => print('2')),
    ButtonData(title: 'three', onTap: () => print('3')),
    ButtonData(title: 'four', onTap: () => print('4')),
    // ButtonData(title: 'five', onTap: () => print('5')),
    // ButtonData(title: 'six', onTap: () => print('6')),
    // ButtonData(title: 'seven', onTap: () => print('7')),
    // ButtonData(title: 'eight', onTap: () => print('8')),
    // ButtonData(onTap: () => print('center'), title: ''),
  ];

  List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(260 / 360),
      child: SizedBox(
        height: 300,
        width: 300,
        child: Stack(
          children: items
              .asMap()
              .map((index, buttonData) {
                if (index < 4) {
                  var degree = 120 / 4 * index;
                  var radian = degree * degrees2Radians;
                  return MapEntry(
                    index,
                    Align(
                      alignment: Alignment(
                        math.sin(radian),
                        math.cos(radian),
                      ),
                      child: Transform.rotate(
                        angle: -radian,
                        child: MenuPetal(
                          angle: -radian,
                          buttonData: buttonData,
                          color: colors[index],
                        ),
                      ),
                    ),
                  );
                }
                return MapEntry(
                  index,
                  _centerButton(buttonData),
                );
              })
              .values
              .toList(),
        ),
      ),
    );
  }

  Widget _centerButton(ButtonData buttonData) {
    return ClipRRect(
      // borderRadius: BorderRadius.circular(25),
      child: GestureDetector(
        onTap: buttonData.onTap,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.black38,
        ),
      ),
    );
  }
}

class ButtonData {
  final String title;
  final void Function() onTap;

  ButtonData({required this.title, required this.onTap});
}

class MenuPetal extends StatelessWidget {
  const MenuPetal({
    Key? key,
    required this.angle,
    required this.buttonData,
    required this.color,
  }) : super(key: key);

  final double angle;
  final ButtonData buttonData;
  final Color color;
  final double factor = 0.5; //Gap

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: factor,
      widthFactor: factor,
      child: GestureDetector(
        onTap: buttonData.onTap,
        child: ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
            alignment: Alignment.center,
            color: color,
            child: RotationTransition(
                turns: AlwaysStoppedAnimation(90 / 360),
                child: Text(buttonData.title)),
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var x = size.width / 100 * 0.802;
    var y = size.height / 100;
    var path = Path()
      ..moveTo(39.4 * x, 6.1 * y)
      ..cubicTo(43.2 * x, -20 * y, 57.1 * x, -20 * y, 60.9 * x, 6.1 * y)
      ..lineTo(99.1 * x, 138)
      ..cubicTo(102.1 * x, 90.2 * y, 99.1 * x, 93.9 * y, 92.0 * x, 95.1 * y)
      ..cubicTo(67.4 * x, 101.7 * y, 36.9 * x, 101.7 * y, 9.2 * x, 95.1 * y)
      ..cubicTo(1.2 * x, 93.8 * y, -1.3 * x, 88.7 * y, 1.2 * x, 138)
      ..lineTo(39.4 * x, 6.1 * y);

    return path.shift(const Offset(12, 0));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

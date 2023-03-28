// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_components/extension/sizer.dart';
import 'package:test/components/buttons/button.dart';
import 'package:test/components/components.dart';

import 'components/text_field_custom/text_field_custom.dart';

void main() => runApp(const MyWidget());

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: TextFieldCustom(),
          ),
        );
      },
    );
  }
}

// ignore_for_file: prefer_const_constructors, avoid_print, must_be_immutable, unused_element

// import 'dart:math' as math;

// import 'package:flutter/material.dart';

// const double degrees2Radians = math.pi / 90.0;

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         backgroundColor: Colors.amber,
//         body: SafeArea(
//           child: MyHomePage(),
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final items = [
//     ButtonData(title: 'one', onTap: () => print('1')),
//     ButtonData(title: 'two', onTap: () => print('2')),
//     ButtonData(title: 'three', onTap: () => print('3')),
//     ButtonData(title: 'four', onTap: () => print('4')),
//     // ButtonData(title: 'five', onTap: () => print('5')),
//     // ButtonData(title: 'six', onTap: () => print('6')),
//     // ButtonData(title: 'seven', onTap: () => print('7')),
//     // ButtonData(title: 'eight', onTap: () => print('8')),
//     // ButtonData(onTap: () => print('center'), title: ''),
//   ];

//   List<Color> colors = [
//     Colors.red,
//     Colors.blue,
//     Colors.green,
//     Colors.yellow,
//   ];

//   MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Center(
//         //   child: RotationTransition(
//         //     turns: AlwaysStoppedAnimation(220 / 360),
//         //     child: SizedBox(
//         //       height: 300,
//         //       width: 300,
//         //       child: Stack(
//         //         children: items
//         //             .asMap()
//         //             .map((index, buttonData) {
//         //               if (index < 4) {
//         //                 var degree = 70 / 4 * index;
//         //                 var radian = degree * degrees2Radians + 0.35;
//         //                 return MapEntry(
//         //                   index,
//         //                   Align(
//         //                     alignment: Alignment(
//         //                       math.sin(radian - 0.55),
//         //                       math.cos(radian - 0.33),
//         //                     ),
//         //                     child: Transform.rotate(
//         //                       angle: -radian + 0.60,
//         //                       child: MenuPetal(
//         //                         buttonData: buttonData,
//         //                         color: colors[index],
//         //                       ),
//         //                     ),
//         //                   ),
//         //                 );
//         //               }
//         //               return MapEntry(
//         //                 index,
//         //                 _centerButton(buttonData),
//         //               );
//         //             })
//         //             .values
//         //             .toList(),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         Positioned(
//           left: 180,
//           height: 750,
//           child: Container(
//               width: 50,
//               height: 50,
//               decoration:
//                   BoxDecoration(shape: BoxShape.circle, color: Colors.black)),
//         ),
//         // Center(
//         //   child: ClipPath(
//         //     clipper: RPSCustomPainter(),
//         //     child: Container(
//         //       width: 200,
//         //       height: 200,
//         //       color: Colors.orange,
//         //     ),
//         //   ),
//         // )
//         Center(
//           child: CustomPaint(
//             size: Size(150,
//                 250), //You can Replace this with your desired WIDTH and HEIGHT
//             painter: RPSCustomPainter(),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _centerButton(ButtonData buttonData) {
//     return ClipRRect(
//       // borderRadius: BorderRadius.circular(25),
//       child: GestureDetector(
//         onTap: buttonData.onTap,
//         child: Container(
//           width: 50,
//           height: 50,
//           color: Colors.black38,
//         ),
//       ),
//     );
//   }
// }

// class ButtonData {
//   final String title;
//   final void Function() onTap;

//   ButtonData({required this.title, required this.onTap});
// }

// class MenuPetal extends StatelessWidget {
//   const MenuPetal({
//     Key? key,
//     required this.buttonData,
//     required this.color,
//   }) : super(key: key);

//   final ButtonData buttonData;
//   final Color color;
//   final double factor = 0.5; //Gap

//   @override
//   Widget build(BuildContext context) {
//     return FractionallySizedBox(
//       heightFactor: factor,
//       widthFactor: factor,
//       child: GestureDetector(
//         onTap: buttonData.onTap,
//         child: ClipPath(
//           clipper: MyCustomClipper(),
//           child: Container(
//             alignment: Alignment.center,
//             color: color,
//             child: RotationTransition(
//                 turns: AlwaysStoppedAnimation(90 / 360),
//                 child: Text(buttonData.title)),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var x = size.width / 130 * 0.812;
//     var y = size.height / 100;
//     var path = Path()
//       ..moveTo(39.4 * x, 6.1 * y) // Bottom Left
//       ..cubicTo(46 * x, -10 * y, 55 * x, -10 * y, 61 * x, 6.1 * y) // Bottom
//       ..lineTo(100 * x, 139) //Top left
//       ..cubicTo(100 * x, 100 * y, 100 * x, 100 * y, 100 * x, 93 * y) // Top Left
//       ..cubicTo(70 * x, 100 * y, 45 * x, 100 * y, 10 * x, 96 * y)
//       ..cubicTo(0 * x, 95 * y, 0 * x, 93 * y, 2 * x, 140) // Top Right
//       ..lineTo(39.4 * x, 6.1 * y); // Bottom Right

//     return path.shift(const Offset(12, 0));
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => true;
// }

// // class PizzaSliceClipper extends CustomClipper<Path> {
// //   @override
// //   Path getClip(Size size) {
// //     final path = Path()
// //       ..lineTo(size.width, 0)
// //       ..quadraticBezierTo()
// //       ..lineTo(size.width / 2, size.height)
// //       ..close();

// //     return path;
// //   }

// //   @override
// //   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// // }

// // class RPSCustomPainter extends CustomPainter {
// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     Paint paint0 = Paint()
// //       ..color = const Color.fromARGB(255, 33, 150, 243)
// //       ..style = PaintingStyle.fill
// //       ..strokeWidth = 1;

// //     Path path0 = Path();
// //     path0.moveTo(size.width * 0.3091667, size.height * 0.2066667);
// //     path0.quadraticBezierTo(size.width * 0.4664583, size.height * 0.1054167,
// //         size.width * 0.6233333, size.height * 0.2050000);
// //     path0.quadraticBezierTo(size.width * 0.5852083, size.height * 0.3541667,
// //         size.width * 0.4741667, size.height * 0.9250000);
// //     path0.lineTo(size.width * 0.3091667, size.height * 0.2066667);
// //     path0.close();

// //     canvas.drawPath(path0, paint0);
// //   }

// //   @override
// //   bool shouldRepaint(covariant CustomPainter oldDelegate) {
// //     return true;
// //   }
// // }

// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;

//     Path path0 = Path();
//     path0.moveTo(size.width * 0.1266667, size.height * 0.1683333);
//     path0.quadraticBezierTo(size.width * 0.4707667, size.height * -0.1191000,
//         size.width * 0.8766667, size.height * 0.1650000);
//     path0.lineTo(size.width * 0.5008333, size.height * 0.9950000);
//     path0.quadraticBezierTo(size.width * 0.4072917, size.height * 0.7883333,
//         size.width * 0.1266667, size.height * 0.1683333);
//     path0.close();

//     canvas.drawPath(path0, paint0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

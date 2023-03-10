import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/button_custom/animation_progress_button/animation_progress_button.dart';
import 'package:flutter_components/widgets/dash_line/dash_line.dart';
import 'package:flutter_components/widgets/draggable_button/draggable_button.dart';
import 'package:flutter_components/widgets/pinput_button/pinput_button.dart';

class Components extends StatefulWidget {
  const Components({super.key});

  @override
  State<Components> createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  ButtonState state = ButtonState.init;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Components"),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DashLine(),
                  PinPutCustom(),
                  DraggableButton(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

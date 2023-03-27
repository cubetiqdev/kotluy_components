import 'package:flutter/material.dart';
import 'package:flutter_components/components/button_custom/animation_progress_button/animation_progress_button.dart';
import 'package:flutter_components/components/dash_line/dash_line.dart';
import 'package:flutter_components/components/draggable_button/draggable_button.dart';
import 'package:flutter_components/components/pinput_button/pinput_button.dart';

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
                  const DashLine(),
                  const PinPutCustom(),
                  DraggableButton(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
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

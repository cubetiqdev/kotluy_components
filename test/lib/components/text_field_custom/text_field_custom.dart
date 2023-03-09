import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/text_field_custom/custom_textformfield.dart';
import 'package:flutter_components/widgets/text_field_custom/passsword_textfield.dart';
import 'package:flutter_components/widgets/text_field_custom/phone_textfield.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Text Field Custom"),
            backgroundColor: Colors.deepOrangeAccent,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: PhoneTextField(
                    countries: const ['KH', 'CN', 'TH', 'VN', 'US'],
                    onValuePicked: (code) {},
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: PasswordTextField(
                    hintText: 'Password',
                    icon: Icons.visibility,
                  ),
                ),
                Container(
                  height: 200,
                  child: CTextFormField(
                    hintText: "Transaction Note",
                    enabledBorder: true,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

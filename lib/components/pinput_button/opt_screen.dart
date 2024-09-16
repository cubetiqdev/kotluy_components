import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  OtpState createState() => OtpState();
}

class OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    otp(),
                    const SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor:
                              WidgetStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              WidgetStateProperty.all<Color>(Colors.purple),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(14.0),
                          child: Text(
                            'Verify',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "Resend New Code",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget otp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _textFieldOTP(first: true, last: false),
        _textFieldOTP(first: false, last: false),
        _textFieldOTP(first: false, last: false),
        _textFieldOTP(first: false, last: false),
      ],
    );
  }

  Widget _textFieldOTP({bool? first, bool? last, bool? readOnly}) {
    return SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
              setState(() {
                readOnly = true;
              });
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: readOnly ?? false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2,
                    color: readOnly == true ? Colors.black12 : Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}


// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_is_empty, use_key_in_widget_constructors, library_private_types_in_public_api

// import 'package:flutter/material.dart';

// class VerifyPhone extends StatefulWidget {
//   @override
//   _VerifyPhoneState createState() => _VerifyPhoneState();
// }

// class _VerifyPhoneState extends State<VerifyPhone> {
//   String code = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(
//             Icons.arrow_back,
//             size: 30,
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SafeArea(
//           child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Expanded(
//             child: Container(
//               color: Colors.white,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         buildCodeNumberBox(
//                             code.length > 0 ? code.substring(0, 1) : ""),
//                         buildCodeNumberBox(
//                             code.length > 1 ? code.substring(1, 2) : ""),
//                         buildCodeNumberBox(
//                             code.length > 2 ? code.substring(2, 3) : ""),
//                         buildCodeNumberBox(
//                             code.length > 3 ? code.substring(3, 4) : ""),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           NumericPad(
//             onNumberSelected: (value) {
//               print(value);
//               setState(() {
//                 if (value != -1) {
//                   if (code.length < 4) {
//                     code = code + value.toString();
//                   }
//                 } else {
//                   code = code.substring(0, code.length - 1);
//                 }
//                 print(code);
//               });
//             },
//           ),
//         ],
//       )),
//     );
//   }

//   Widget buildCodeNumberBox(String codeNumber) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 8),
//       child: SizedBox(
//         width: 60,
//         height: 60,
//         child: Container(
//           decoration: BoxDecoration(
//             color: Color(0xFFF6F5FA),
//             borderRadius: BorderRadius.all(
//               Radius.circular(15),
//             ),
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 25.0,
//                   spreadRadius: 1,
//                   offset: Offset(0.0, 0.75))
//             ],
//           ),
//           child: Center(
//             child: Text(
//               codeNumber,
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF1F1F1F),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NumericPad extends StatelessWidget {
//   final Function(int) onNumberSelected;

//   NumericPad({required this.onNumberSelected});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color(0xFFF5F4F9),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           Container(
//             height: MediaQuery.of(context).size.height * 0.11,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 buildNumber(1),
//                 buildNumber(2),
//                 buildNumber(3),
//               ],
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.11,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 buildNumber(4),
//                 buildNumber(5),
//                 buildNumber(6),
//               ],
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.11,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 buildNumber(7),
//                 buildNumber(8),
//                 buildNumber(9),
//               ],
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.11,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 buildEmptySpace(),
//                 buildNumber(0),
//                 buildBackspace(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildNumber(int number) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           onNumberSelected(number);
//         },
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(15),
//               ),
//             ),
//             child: Center(
//               child: Text(
//                 number.toString(),
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF1F1F1F),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildBackspace() {
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           onNumberSelected(-1);
//         },
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(15),
//               ),
//             ),
//             child: Center(
//               child: Icon(
//                 Icons.backspace,
//                 size: 28,
//                 color: Color(0xFF1F1F1F),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildEmptySpace() {
//     return Expanded(
//       child: Container(),
//     );
//   }
// }

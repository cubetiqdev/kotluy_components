import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinPutCustom extends StatefulWidget {
  final int? length;
  final TextEditingController? pinController;
  final String? Function(String?)? validator;
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final AndroidSmsAutofillMethod? androidSmsAutofillMethod;
  final bool? listenForMultipleSmsOnAndroid;
  final PinTheme? defaultPinTheme;
  final PinTheme? focusedPinTheme;
  final PinTheme? submittedPinTheme;
  final PinTheme? errorPinTheme;
  const PinPutCustom(
      {super.key,
      this.length,
      this.pinController,
      this.focusNode,
      this.androidSmsAutofillMethod,
      this.listenForMultipleSmsOnAndroid,
      this.defaultPinTheme,
      this.validator,
      this.onCompleted,
      this.onChanged,
      this.focusedPinTheme,
      this.submittedPinTheme,
      this.errorPinTheme});

  @override
  State<PinPutCustom> createState() => _PinPutCustomState();
}

final pinController = TextEditingController();
final formKey = GlobalKey<FormState>();

class _PinPutCustomState extends State<PinPutCustom> {
  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Pinput(
      length: widget.length ?? 6,
      controller: widget.pinController,
      focusNode: widget.focusNode,
      androidSmsAutofillMethod: widget.androidSmsAutofillMethod ??
          AndroidSmsAutofillMethod.smsRetrieverApi,
      listenForMultipleSmsOnAndroid:
          widget.listenForMultipleSmsOnAndroid ?? true,
      defaultPinTheme: widget.defaultPinTheme ?? defaultPinTheme,
      validator: widget.validator,
      hapticFeedbackType: HapticFeedbackType.mediumImpact,
      onCompleted: widget.onCompleted,
      onChanged: widget.onChanged,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: focusedBorderColor,
          ),
        ],
      ),
      focusedPinTheme: widget.focusedPinTheme ??
          defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: focusedBorderColor),
            ),
          ),
      submittedPinTheme: widget.submittedPinTheme ??
          defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: fillColor,
              borderRadius: BorderRadius.circular(19),
              border: Border.all(color: focusedBorderColor),
            ),
          ),
      errorPinTheme: widget.errorPinTheme ??
          defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
    );
  }
}

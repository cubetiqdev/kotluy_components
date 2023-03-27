import 'package:flutter/material.dart';
import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:pinput/pinput.dart';

class PinPutCustom extends StatefulWidget {
  final int? length;
  final TextEditingController? pinController;
  final Color? focusedPinThemeColor;
  final Color? borderColor;
  final Color? fillColor;
  final Color? textColor;
  final PinTheme? defaultPinTheme;
  final PinTheme? focusedPinTheme;
  final PinTheme? submittedPinTheme;
  final PinTheme? errorPinTheme;
  final String? Function(String?)? validator;
  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final AndroidSmsAutofillMethod? androidSmsAutofillMethod;
  final bool? listenForMultipleSmsOnAndroid;

  const PinPutCustom({
    super.key,
    this.length,
    this.pinController,
    this.focusedPinThemeColor,
    this.borderColor,
    this.fillColor,
    this.textColor,
    this.defaultPinTheme,
    this.focusedPinTheme,
    this.submittedPinTheme,
    this.errorPinTheme,
    this.validator,
    this.onCompleted,
    this.onChanged,
    this.focusNode,
    this.androidSmsAutofillMethod,
    this.listenForMultipleSmsOnAndroid,
  });

  @override
  State<PinPutCustom> createState() => _PinPutCustomState();
}

final pinController = TextEditingController();
final formKey = GlobalKey<FormState>();

class _PinPutCustomState extends State<PinPutCustom> {
  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = ThemeColor.PRIMARY_MAIN;
    const fillColor = Colors.transparent;
    const borderColor = ThemeColor.SECONDARY_MAIN;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 22,
        color: widget.textColor ?? const Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: widget.borderColor ?? borderColor),
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
            color: widget.focusedPinThemeColor ?? focusedBorderColor,
          ),
        ],
      ),
      focusedPinTheme: widget.focusedPinTheme ??
          defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: widget.focusedPinThemeColor ?? focusedBorderColor),
            ),
          ),
      submittedPinTheme: widget.submittedPinTheme ??
          defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration!.copyWith(
              color: widget.fillColor ?? fillColor,
              borderRadius: BorderRadius.circular(19),
              border: Border.all(
                  color: widget.focusedPinThemeColor ?? focusedBorderColor),
            ),
          ),
      errorPinTheme: widget.errorPinTheme ??
          defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
    );
  }
}

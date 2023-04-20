import 'package:flutter/material.dart';
import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:pinput/pinput.dart';

class PinPutCustom extends StatefulWidget {
  final int? length;
  final TextStyle? textStyle;
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
    this.textStyle,
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
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: widget.textStyle ??
          TextStyle(
            fontSize: 25,
            color: widget.textColor ?? const Color.fromRGBO(30, 60, 87, 1),
          ),
    );
    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: borderColor??ThemeColor.SECONDARY_MAIN,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: ThemeColor.SECONDARY_MAIN,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    return Pinput(
      pinAnimationType: PinAnimationType.fade,
      showCursor: true,
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
      cursor: cursor,
      preFilledWidget: preFilledWidget,
    );
  }
}

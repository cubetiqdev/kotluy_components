import 'package:flutter_components/constant/colors/default_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';

class CTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final bool hidePassword;
  final bool? filled;
  final bool readOnly;
  final bool? noPadding;
  final bool? enabled;
  final Color? hintTextColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? borderColor;
  final Color? filledColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? borderRadius;
  final TextInputType? keyboardType;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapTextField;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final double? borderWidth;
  final bool autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final AutovalidateMode? autovalidateMode;
  const CTextField({
    super.key,
    this.focusNode,
    this.errorStyle,
    this.autovalidateMode,
    this.textAlign,
    this.contentPadding,
    this.hintText,
    this.filled,
    this.textAlignVertical,
    this.labelText,
    this.validator,
    this.autofocus = false,
    this.errorText,
    this.textStyle,
    this.hintStyle,
    this.controller,
    this.hidePassword = false,
    this.readOnly = false,
    this.noPadding = false,
    this.enabled,
    this.hintTextColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.borderColor,
    this.filledColor,
    this.suffixIconColor,
    this.prefixIconColor,
    this.suffixIcon,
    this.prefixIcon,
    this.borderRadius,
    this.keyboardType,
    this.onTap,
    this.onTapTextField,
    this.onSaved,
    this.onChanged,
    this.inputFormatters,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: noPadding == true ? 0 : 20),
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        textAlign: textAlign ?? TextAlign.start,
        enabled: enabled,
        autofocus: autofocus,
        textAlignVertical: textAlignVertical,
        focusNode: focusNode,
        onTap: onTapTextField,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        readOnly: readOnly,
        inputFormatters: inputFormatters ??
            [
              LengthLimitingTextInputFormatter(120),
            ],
        obscureText: hidePassword,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        style: textStyle ?? KLabelTextRegular12,
        decoration: InputDecoration(
          filled: filled,
          labelText: labelText,
          hintText: hintText,
          hintStyle: hintStyle ??
              KLabelTextRegular12.copyWith(color: ThemeColor.DARK_D4),
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          fillColor: filledColor ?? ThemeColor.LIGHT_L3,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
            borderSide: BorderSide(
              width: borderWidth ?? 1,
              color: enabledBorderColor ?? ThemeColor.DARK_D4,
            ),
          ),
          errorStyle: errorStyle ??
              Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.error),
          errorText: errorText,
          errorMaxLines: 1,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
            borderSide: BorderSide(
                color: focusedBorderColor ?? ThemeColor.PRIMARY_MAIN, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
            borderSide: BorderSide(
              width: borderWidth ?? 1,
              color: ThemeColor.DARK_D4,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
            borderSide: BorderSide(
              width: borderWidth ?? 1,
              color: borderColor ?? ThemeColor.DARK_D4,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
            borderSide: BorderSide(
              width: borderWidth ?? 1,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 25.0),
            borderSide: BorderSide(
              width: borderWidth ?? 1,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          suffixIcon: suffixIcon,
          suffixIconColor: suffixIconColor,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
        ),
      ),
    );
  }
}

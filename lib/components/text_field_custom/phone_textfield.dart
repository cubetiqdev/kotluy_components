// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

import 'package:flutter_components/constant/colors/color.dart';
import 'package:flutter_components/constant/fonts/default_font.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneTextField extends StatefulWidget {
  final bool? noPadding;
  final TextStyle? textStyle;
  final TextEditingController? controllerPhone;
  final String? hintText;
  final String? initialSelection;
  final String? initialValue;
  final String? Function(String?)? validatorPhone;
  final List<String>? countries;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget Function(Country)? itemBuilder;
  final ValueChanged<String>? onChangedPhone;
  final void Function(Country) onValuePicked;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? borderColor;
  final Color? hintTextColor;
  final Color? fillColor;
  final Color? dropDownColor;

  const PhoneTextField({
    Key? key,
    this.noPadding = false,
    this.textStyle,
    this.controllerPhone,
    this.hintText,
    this.initialSelection,
    this.initialValue,
    this.validatorPhone,
    this.countries,
    this.inputFormatters,
    this.icon,
    this.suffixIcon,
    this.itemBuilder,
    this.onChangedPhone,
    required this.onValuePicked,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.borderColor,
    this.hintTextColor,
    this.fillColor,
    this.dropDownColor,
  }) : super(key: key);

  @override
  _TextFieldPhoneState createState() => _TextFieldPhoneState();
}

class _TextFieldPhoneState extends State<PhoneTextField> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: widget.noPadding == true ? 0 : 20),
        child: TextFormField(
          initialValue: widget.initialValue,
          maxLines: 1,
          controller: widget.controllerPhone,
          keyboardType: TextInputType.phone,
          validator: widget.validatorPhone,
          onChanged: widget.onChangedPhone,
          inputFormatters: widget.inputFormatters ??
              <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.deny(RegExp('^0+')),
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: CountryPickerDropdown(
                itemBuilder: widget.itemBuilder ?? _buildDropdownItem,
                initialValue: widget.initialValue ?? 'KH',
                itemFilter: (c) =>
                    widget.countries?.contains(c.isoCode) ?? true,
                sortComparator: (Country a, Country b) =>
                    a.name.compareTo(b.name),
                onValuePicked: widget.onValuePicked,
                dropdownColor: widget.dropDownColor,
                icon: widget.icon,
              ),
            ),
            contentPadding:
                new EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            fillColor: widget.fillColor ?? Colors.white,
            hintText: widget.hintText ?? "000-000-000",
            hintStyle: KLabelTextRegular14.copyWith(
                color: widget.hintTextColor ?? ThemeColor.DARK_D4),
            enabledBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.enabledBorderColor ?? ThemeColor.DARK_D4),
            ),
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: widget.borderColor ?? ThemeColor.DARK_D4, width: 1),
            ),
            focusedBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10),
              borderSide: BorderSide(
                color: widget.focusedBorderColor ?? ThemeColor.PRIMARY_MAIN,
              ),
            ),
          ),
          style: widget.textStyle ?? KLabelTextRegular14,
        ),
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "+${country.phoneCode}",
            style: widget.textStyle ?? KLabelTextRegular14,
          ),
        ],
      );
}

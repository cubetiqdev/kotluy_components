// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

import 'package:component_sdk/constant/colors/color.dart';
import 'package:component_sdk/constant/fonts/default_font.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneTextField extends StatefulWidget {
  final String? Function(String?)? validatorPhone;
  final TextEditingController? controllerPhone;
  final ValueChanged<String>? onChangedPhone;
  final Widget? icon;
  final bool? noPadding;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final String? initialSelection;
  final String? initialValue;
  final List<String>? countries;
  final void Function(Country) onValuePicked;
  final Widget Function(Country)? itemBuilder;
  final String? hintText;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? borderColor;
  final Color? hintTextColor;
  final Color? fillColor;
  final Color? dropDownColor;
  final List<TextInputFormatter>? inputFormatters;

  const PhoneTextField(
      {Key? key,
      this.validatorPhone,
      this.controllerPhone,
      this.noPadding = false,
      this.onChangedPhone,
      this.suffixIcon,
      this.initialSelection,
      this.initialValue,
      this.countries,
      required this.onValuePicked,
      this.itemBuilder,
      this.hintText,
      this.inputFormatters,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.borderColor,
      this.hintTextColor,
      this.fillColor,
      this.dropDownColor,
      this.textStyle,
      this.icon})
      : super(key: key);

  @override
  _TextFieldPhoneState createState() => _TextFieldPhoneState();
}

class _TextFieldPhoneState extends State<PhoneTextField> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: widget.noPadding == true ? 0 : 40),
        child: Expanded(
          child: TextFormField(
            initialValue: widget.initialValue,
            maxLines: 1,
            controller: widget.controllerPhone,
            keyboardType: TextInputType.phone,
            validator: widget.validatorPhone,
            onChanged: widget.onChangedPhone,
            inputFormatters: widget.inputFormatters ??
                <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
            decoration: InputDecoration(
              suffix: CountryPickerDropdown(
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
              contentPadding:
                  new EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              fillColor: widget.fillColor ?? Colors.white,
              hintText: widget.hintText ?? "000-000-000",
              hintStyle: KLabelTextNormal14.copyWith(
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
            style: widget.textStyle ??
                KLabelTextNormal14.copyWith(
                  color: KDark1,
                ),
          ),
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
            style: widget.textStyle,
          ),
        ],
      );
}

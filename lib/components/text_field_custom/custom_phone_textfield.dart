import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyPhoneTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? styleDropDown;
  final List<String>? countries;
  final String? errorText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final void Function(Country) onValuePicked;

  const MyPhoneTextField(
      {Key? key,
      this.controller,
     required this.onValuePicked,
      this.errorText,
      this.onChanged,
      this.validator,
      this.countries,
      this.styleDropDown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: Theme.of(context).colorScheme.secondary),
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.deny(RegExp('^0+')),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      decoration: InputDecoration(
          hintText: '000-000-000',
          hintStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.outline),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          errorStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Theme.of(context).colorScheme.error),
          errorText:errorText ,
          errorMaxLines: 1,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          focusedErrorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.error,
            ),
          ) ,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 32, right: 14),
            child: CountryPickerDropdown(
              iconSize: 24.0,
              itemFilter: (c) => countries?.contains(c.isoCode) ?? true,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 24.0,
                color: Theme.of(context).colorScheme.outline,
              ),
              sortComparator: (Country a, Country b) =>
                  a.name.compareTo(b.name),
              onValuePicked: onValuePicked,
              itemBuilder: (country) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      CountryPickerUtils.getFlagImageAssetPath(country.isoCode),
                      height: 24.0,
                      width: 24.0,
                      fit: BoxFit.contain,
                      package: "country_pickers",
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "+${country.phoneCode}",
                    style: styleDropDown,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

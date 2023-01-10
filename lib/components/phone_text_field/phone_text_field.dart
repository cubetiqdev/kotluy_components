// ignore_for_file: library_private_types_in_public_api, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new

import 'package:component_sdk/constant/colors/color.dart';
import 'package:component_sdk/constant/fonts/default_font.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPhone extends StatefulWidget {
  final String? Function(String?)? validatorPhone;
  final TextEditingController? controllerPhone;
  final ValueChanged<String>? onChangedPhone;
  final bool? noPadding;
  final Widget? suffixIcon;
  final String? initialSelection;
  final String? initialValue;

  const TextFieldPhone(
      {Key? key,
      this.validatorPhone,
      this.controllerPhone,
      this.noPadding = false,
      this.onChangedPhone,
      this.suffixIcon,
      this.initialSelection,
      this.initialValue})
      : super(key: key);

  @override
  _TextFieldPhoneState createState() => _TextFieldPhoneState();
}

class _TextFieldPhoneState extends State<TextFieldPhone> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: widget.noPadding == true ? 0 : 40),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: ThemeColor.DARK_D4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  showCountryPicker(
                    context: context,
                    //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                    exclude: <String>['KN', 'MF'],
                    favorite: <String>['SE'],
                    //Optional. Shows phone code before the country name.
                    showPhoneCode: true,
                    onSelect: (Country country) {
                      print('Select country: ${country.displayName}');
                    },
                    // Optional. Sets the theme for the country list picker.
                    countryListTheme: CountryListThemeData(
                      // Optional. Sets the border radius for the bottomsheet.
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      // Optional. Styles the search field.
                      inputDecoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Start typing to search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                          ),
                        ),
                      ),
                      // Optional. Styles the text in the search field
                      searchTextStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
                child: null,
              ),
              // CountryCodePicker(
              //   initialSelection: widget.initialSelection,
              //   countryFilter: ['KH'],
              //   showFlag: false,
              //   padding: EdgeInsets.zero,
              //   showFlagDialog: true,
              //   textStyle:
              //       KLabelTextMedium14.copyWith(color: ThemeColor.DARK_D1),
              //   dialogTextStyle:
              //       KLabelTextNormal14.copyWith(color: ThemeColor.DARK_D1),
              //   searchStyle:
              //       KLabelTextNormal14.copyWith(color: ThemeColor.DARK_D1),
              //   dialogSize: Size.square(300),
              //   onChanged: widget.onChangedCode,
              // ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                initialValue: widget.initialValue,
                maxLines: 1,
                controller: widget.controllerPhone,
                keyboardType: TextInputType.phone,
                validator: widget.validatorPhone,
                onChanged: widget.onChangedPhone,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                  suffix: widget.suffixIcon ?? SizedBox.shrink(),
                  contentPadding:
                      new EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  fillColor: Colors.white,
                  hintText: "000-000-000",
                  hintStyle:
                      KLabelTextNormal14.copyWith(color: ThemeColor.DARK_D4),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10),
                    borderSide: const BorderSide(color: ThemeColor.DARK_D4),
                  ),
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: ThemeColor.DARK_D4, width: 1),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: ThemeColor.PRIMARY_MAIN,
                    ),
                  ),
                ),
                style: KLabelTextNormal14.copyWith(
                  color: KDark1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

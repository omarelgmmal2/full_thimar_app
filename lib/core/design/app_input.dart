import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import '../utils/text_styles.dart';
import 'app_image.dart';

class AppInput extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText, icon;
  final TextInputType? type;
  final Function(String)? onChanged;
  final double paddingBottom, paddingTop;
  final bool isPhone, isPassword, isEnabled;
  final FormFieldValidator<String?>? validator;

  const AppInput({
    super.key,
    this.validator,
    this.controller,
    this.isEnabled = true,
    required this.labelText,
    required this.icon,
    this.paddingBottom = 16,
    this.paddingTop = 0,
    this.isPhone = false,
    this.isPassword = false,
    this.type,
    this.onChanged,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isPasswordHidden = true;
  Country selectedCountry = Country(
    phoneCode: "20",
    countryCode: "EG",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Egypt",
    example: "Egypt",
    displayName: "Egypt",
    displayNameNoCountryCode: "EG",
    e164Key: "",
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: widget.paddingBottom, top: widget.paddingTop),
      child: TextFormField(
        keyboardType: widget.type,
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        enabled: widget.isEnabled,
        obscureText: isPasswordHidden && widget.isPassword,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(isPasswordHidden
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    isPasswordHidden = !isPasswordHidden;
                    setState(() {});
                  },
                )
              : null,
          icon: widget.isPhone
              ? GestureDetector(
            onTap: () {
              showCountryPicker(
                  context: context,
                  countryListTheme: const CountryListThemeData(
                    bottomSheetHeight: 550,
                  ),
                  onSelect: (value) {
                    setState(() {
                      selectedCountry = value;
                    });
                  });
            },
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(
                          0xffF3F3F3,
                        ),
                      ),
                    ),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                        selectedCountry.flagEmoji,
                        style: TextStyles.textStyle15Medium,
                      ),
                        Text(
                        "${selectedCountry.phoneCode}+",
                        style: TextStyles.textStyle15Medium,
                      ),
                      ],
                    ),
                  ),
              )
              : null,
          prefixIcon: AppImage(
            widget.icon,
            fit: BoxFit.scaleDown,
            height: 20,
            width: 18,
          ),
        ),
      ),
    );
  }
}

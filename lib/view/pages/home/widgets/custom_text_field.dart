import 'package:flutter/material.dart';
import 'package:web_api_app/view/utils/color.dart';
import 'package:web_api_app/view/utils/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final int? lines;
  bool obscureText;
  CustomTextFormField(
      {super.key,
      this.suffixIcon,
      this.prefixIcon,
      this.hintText,
      this.validator,
      this.lines,
      this.controller,
      this.keyboardType,
      this.obscureText = true,
      this.hintStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // color: const Color.fromARGB(255, 239, 239, 240),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: TextFormField(
            style: TxtStyles.textWFonts,
            maxLines: lines,
            decoration: InputDecoration(
              hintStyle: hintStyle,
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Clr.whiteP,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Clr.white,
                  width: 4.0,
                ),
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hintText,
            ),
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
          ),
        ),
      ),
    );
  }
}

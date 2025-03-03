import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruites_hup/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Builds a [TextFormField] widget with specified keyboard type, hint text,
  /// and an optional suffix icon. The field has a custom input decoration
  /// including a hint style, fill color, and borders. Suitable for use
  /// within forms requiring text input.

/******  d5339820-48d5-483b-b1db-a65e143c9b82  *******/
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xFF949D9E),
        ),
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}

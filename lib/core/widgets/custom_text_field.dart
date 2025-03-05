import 'package:flutter/material.dart';
import 'package:fruites_hup/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.onSaved,
      required this.textInputType,
      this.suffixIcon});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  TextEditingController? controller;
  final void Function(String?)? onSaved;
  @override

  /// Builds a [TextFormField] widget with specified keyboard type, hint text,
  /// and an optional suffix icon. The field has a custom input decoration
  /// including a hint style, fill color, and borders. Suitable for use
  /// within forms requiring text input.

  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field is required.';
        }
        return null;
      },
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

import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
    this.validatorfunc,
    required this.controller,
  });

  final void Function(String?)? onSaved;
  final TextEditingController controller;
  final String? Function(String?)? validatorfunc;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: widget.validatorfunc,
      controller: widget.controller,
      obscureText: _isObscure,
      onSaved: widget.onSaved,
      suffixIcon: IconButton(
        onPressed: _toggleVisibility,
        icon: Icon(
          _isObscure ? Icons.visibility : Icons.visibility_off,
          color: const Color(0xffC9CECF),
        ),
      ),
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
    );
  }
}

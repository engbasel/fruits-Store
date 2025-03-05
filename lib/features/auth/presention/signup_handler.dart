import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruites_hup/core/utils/debug_logger.dart';
import 'package:fruites_hup/features/auth/presention/cubits/sign_up_cubit/sign_up_cubit.dart';

class SignupHandler {
  static void onSignupPressed({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required Function(AutovalidateMode mode) updateValidationMode,
  }) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      final String name = nameController.text.trim();
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();

      DebugLogger.log(
          '✅ VALIDATION PASSED', 'Form is valid, proceeding with sign-up.');

      context.read<SingupcubitCubit>().createAccountWithEmailAndPassword(
            email,
            password,
            name,
          );

      DebugLogger.log('🟢 ACCOUNT CREATION',
          'Creating account with:\nEmail: $email\nPassword: [HIDDEN]\nName: $name');

      // Clear input fields after successful sign-up
      nameController.clear();
      emailController.clear();
      passwordController.clear();

      DebugLogger.log(
          '🔄 INPUT CLEARED', 'Resetting input fields after submission.');
    } else {
      DebugLogger.log('❌ VALIDATION FAILED',
          'Form validation failed, enabling auto-validation.');
      updateValidationMode(AutovalidateMode.always);
    }
  }
}

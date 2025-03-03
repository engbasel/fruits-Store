import 'package:flutter/material.dart';
import 'package:fruites_hup/core/widgets/custom_app_bar.dart';
import 'package:fruites_hup/features/auth/presention/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل دخول'),
      backgroundColor: Colors.white,
      body: SafeArea(child: LoginViewBody()),
    );
  }
}

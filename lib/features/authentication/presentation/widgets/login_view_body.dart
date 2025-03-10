import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruites_hup/core/utils/ValidationTextField.dart';
import 'package:fruites_hup/core/utils/app_assets.dart';
import 'package:fruites_hup/core/utils/app_colors.dart';
import 'package:fruites_hup/core/utils/app_text_styles.dart';
import 'package:fruites_hup/core/utils/constants.dart';
import 'package:fruites_hup/core/widgets/custom_button.dart';
import 'package:fruites_hup/core/widgets/custom_text_field.dart';
import 'package:fruites_hup/features/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/or_divider.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/social_login_button.dart';
import 'package:fruites_hup/features/localization/app_localizations.dart';

import 'dont_have_account_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  _LoginViewBodyState createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Function to handle login process
  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<SingincubitCubit>().LoginWithEmailAndPassword(
            emailController.text.trim(),
            passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.kHorizintalPadding,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (p0) {},
                controller: emailController,
                validator: ValidationTextField.validateEmail,
                hintText: 'enter_your_email'.tr(context), // Localized hint
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (p0) {},
                controller: passwordController,
                validator: ValidationTextField.validatePassword,
                hintText: 'enter_your_password'.tr(context), // Localized hint
                textInputType: TextInputType.visiblePassword,
                suffixIcon: const Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffC9CECF),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'forgot_password'.tr(context), // Localized text
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              CustomButton(
                onPressed: _handleLogin,
                text: 'login'.tr(context), // Localized button text
              ),
              const SizedBox(height: 33),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {
                  context.read<SingincubitCubit>().signInWithGoogle();
                },
                image: Assets.assetsImagesGoogleIcon,
                title: 'or_continue_with_google'
                    .tr(context), // Localized social login
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.assetsImagesApplIcon,
                title: 'or_continue_with_apple'
                    .tr(context), // Localized social login
              ),
              const SizedBox(height: 16),
              SocialLoginButton(
                onPressed: () {
                  context.read<SingincubitCubit>().signInWithFacebook();
                },
                image: Assets.assetsImagesFacebookIcon,
                title: 'or_continue_with_facebook'
                    .tr(context), // Localized social login
              ),
            ],
          ),
        ),
      ),
    );
  }
}

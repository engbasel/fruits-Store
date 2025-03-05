import 'package:flutter/material.dart';
import 'package:fruites_hup/core/utils/constants.dart';
import 'package:fruites_hup/core/widgets/custom_button.dart';
import 'package:fruites_hup/core/widgets/custom_text_field.dart';
import 'package:fruites_hup/features/authentication/presentation/handler/signup_handler.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/have_an_account_widget.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void updateValidationMode(AutovalidateMode mode) {
    setState(() {
      autovalidateMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                controller: nameController,
                onSaved: (value) => nameController.text = value!,
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: emailController,
                onSaved: (value) => emailController.text = value!,
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                controller: passwordController,
                onSaved: (value) => passwordController.text = value!,
                suffixIcon:
                    Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 16),
              TermsAndConditionsWidget(),
              SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  SignupHandler.onSignupPressed(
                    context: context,
                    formKey: formKey,
                    nameController: nameController,
                    emailController: emailController,
                    passwordController: passwordController,
                    updateValidationMode: updateValidationMode,
                  );
                },
                text: 'إنشاء حساب جديد',
              ),
              SizedBox(height: 26),
              HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

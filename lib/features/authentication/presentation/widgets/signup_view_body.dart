import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:fruites_hup/core/utils/ValidationTextField.dart';
import 'package:fruites_hup/core/utils/constants.dart';
import 'package:fruites_hup/core/widgets/custom_button.dart';
import 'package:fruites_hup/core/widgets/custom_text_field.dart';
import 'package:fruites_hup/core/widgets/password_field.dart';
import 'package:fruites_hup/features/authentication/presentation/handler/signup_handler.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/have_an_account_widget.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isTermsAccepted = false;

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
                validator: ValidationTextField.validateName,
                controller: nameController,
                onSaved: (value) => nameController.text = value!,
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                validator: ValidationTextField.validateEmail,
                controller: emailController,
                onSaved: (value) => emailController.text = value!,
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(
                validatorfunc: ValidationTextField.validatePassword,
                controller: passwordController,
                onSaved: (value) => passwordController.text = value!,
              ),
              const SizedBox(height: 16),
              TermsAndConditionsWidget(
                onChanged: (value) {
                  setState(() {
                    isTermsAccepted = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  if (!isTermsAccepted) {
                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'تنبيه!',
                        message:
                            'يجب الموافقة على الشروط والأحكام قبل إنشاء الحساب.',
                        contentType: ContentType.failure,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                    return;
                  }

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
              const SizedBox(height: 26),
              HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

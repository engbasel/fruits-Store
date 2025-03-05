import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruites_hup/core/utils/constants.dart';
import 'package:fruites_hup/core/widgets/custom_button.dart';
import 'package:fruites_hup/core/widgets/custom_text_field.dart';
import 'package:fruites_hup/features/auth/presention/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruites_hup/features/auth/presention/widgets/have_an_account_widget.dart';
import 'package:fruites_hup/features/auth/presention/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailAddresscontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  void debugLog(String label, String message) {
    debugPrint('''
------------------------------------------------------------
📌 [$label] 
------------------------------------------------------------
$message
------------------------------------------------------------
''');
  }

  void onSignupPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      debugLog(
          '✅ VALIDATION PASSED', 'Form is valid, proceeding with sign-up.');

      context.read<SingupcubitCubit>().createAccountWithEmailAndPassword(
            email,
            password,
            name,
          );

      debugLog('🟢 ACCOUNT CREATION',
          'Creating account with:\nEmail: $email\nPassword: [HIDDEN]\nName: $name');

      passwordcontroller.clear();
      emailAddresscontroller.clear();
      namecontroller.clear();

      debugLog('🔄 INPUT CLEARED', 'Resetting input fields after submission.');
    } else {
      debugLog('❌ VALIDATION FAILED',
          'Form validation failed, enabling auto-validation.');

      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
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
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  controller: namecontroller,
                  onSaved: (VALUE) {
                    name = VALUE!;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.name),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  controller: emailAddresscontroller,
                  onSaved: (VALUE) {
                    email = VALUE!;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: passwordcontroller,
                onSaved: (VALUE) {
                  password = VALUE!;
                },
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffC9CECF),
                ),
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 16,
              ),
              TermsAndConditionsWidget(),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: onSignupPressed,
                text: 'إنشاء حساب جديد',
              ),
              SizedBox(
                height: 26,
              ),
              HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

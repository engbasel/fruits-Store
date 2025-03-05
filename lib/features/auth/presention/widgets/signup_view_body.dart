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

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
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
                  onSaved: (VALUE) {
                    name = VALUE!;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.name),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (VALUE) {
                    email = VALUE!;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
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
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context
                        .read<SingupcubitCubit>()
                        .createAccountWithEmailAndPassword(
                            email, password, name);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                  print('Form submitted');
                  // Navigate to the home screen
                },
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruites_hup/core/utils/app_assets.dart';
import 'package:fruites_hup/core/utils/app_colors.dart';
import 'package:fruites_hup/core/utils/app_text_styles.dart';
import 'package:fruites_hup/core/utils/constants.dart';
import 'package:fruites_hup/core/widgets/custom_button.dart';
import 'package:fruites_hup/core/widgets/custom_text_field.dart';
import 'package:fruites_hup/features/authentication/presentation/cubits/singincubit/singincubit_cubit.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/or_divider.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/social_login_button.dart';

import 'dont_have_account_widget.dart';

// ignore: must_be_immutable
class LoginViewBody extends StatelessWidget {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordContrroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.kHorizintalPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  // height: MediaQuery.of(context).size.height * .03,
                  ),
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                validator: (p0) {
                  return null;
                },
                controller: EmailController,
                onSaved: (p0) {},
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: PasswordContrroler,
                validator: (p0) {
                  return null;
                },
                onSaved: (p0) {},
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffC9CECF),
                ),
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              CustomButton(
                onPressed: () {
                  context.read<SingincubitCubit>().LoginWithEmailAndPassword(
                        EmailController.text,
                        PasswordContrroler.text,
                      );
                },
                text: 'تسجيل دخول',
              ),
              const SizedBox(
                height: 33,
              ),
              const DontHaveAnAccountWidget(),
              const SizedBox(
                height: 33,
              ),
              const OrDivider(),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.assetsImagesGoogleIcon,
                title: 'تسجيل بواسطة جوجل',
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.assetsImagesApplIcon,
                title: 'تسجيل بواسطة أبل',
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {},
                image: Assets.assetsImagesFacebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

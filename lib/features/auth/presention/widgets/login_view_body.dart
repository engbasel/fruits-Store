import 'package:flutter/material.dart';
import 'package:fruites_hup/core/utils/app_assets.dart';
import 'package:fruites_hup/core/utils/app_colors.dart';
import 'package:fruites_hup/core/utils/app_text_styles.dart';
import 'package:fruites_hup/core/utils/constants.dart';
import 'package:fruites_hup/core/widgets/custom_button.dart';
import 'package:fruites_hup/core/widgets/custom_text_field.dart';
import 'package:fruites_hup/features/auth/presention/widgets/or_divider.dart';
import 'package:fruites_hup/features/auth/presention/widgets/social_login_button.dart';

import 'dont_have_account_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

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
              const CustomTextFormField(
                hintText: 'البريد الالكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
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
                onPressed: () {},
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

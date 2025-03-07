import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruites_hup/core/utils/app_colors.dart';
import 'package:fruites_hup/features/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/login_view_body.dart';
import 'package:fruites_hup/features/home/presentation/views/Home_view.dart';

class CustomSignInBlocConsumer extends StatelessWidget {
  const CustomSignInBlocConsumer({super.key});

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents closing by tapping outside
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              backgroundColor: AppColors.lightPrimaryColor.withOpacity(0.3),
              strokeWidth: 5,
            ),
          ),
        );
      },
    );
  }

  void _dismissDialog(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingincubitCubit, SingincubitState>(
      listener: (context, state) {
        if (state is SingincubitLoading) {
          _showLoadingDialog(context); // Show loading indicator
        } else {
          _dismissDialog(context); // Dismiss loading when state changes
        }

        if (state is SignInCubitSuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم تسجيل الدخول بنجاح')),
          );
          Navigator.pushReplacementNamed(context, homeView.routeName);
        }

        if (state is SingincubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return LoginViewBody();
      },
    );
  }
}

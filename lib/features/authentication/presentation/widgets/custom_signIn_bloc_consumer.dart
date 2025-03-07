import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruites_hup/features/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/login_view_body.dart';
import 'package:fruites_hup/features/home/presentation/views/Home_view.dart';

class CustomSignInBlocConsumer extends StatelessWidget {
  const CustomSignInBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingincubitCubit, SingincubitState>(
      listener: (context, state) {
        if (state is SignInCubitSuccessfully) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم تسجيل الدخول بنجاح'),
            ),
          );
          // Navigate to home screen after successful login
          Navigator.pushReplacementNamed(context, homeView.routeName);
        }
        if (state is SingincubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
        if (state is SingincubitLoading) {}
      },
      builder: (context, state) {
        return LoginViewBody();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruites_hup/features/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomSignupBlocConsumer extends StatelessWidget {
  const CustomSignupBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingupcubitCubit, SingupcubitState>(
      listener: (context, state) {
        if (state is SingupcubitSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('تم إنشاء الحساب بنجاح'),
          ));
        }
        if (state is SingupcubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
          ));
        }
        if (state is SingupcubitLoading) {}
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SingupcubitLoading ? true : false,
          opacity: 0.5,
          child: SignupViewBody(),
        );
      },
    );
  }
}

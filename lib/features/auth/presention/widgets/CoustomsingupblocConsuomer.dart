import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruites_hup/features/auth/presention/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruites_hup/features/auth/presention/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CoustomsingupblocConsuomer extends StatelessWidget {
  const CoustomsingupblocConsuomer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingupcubitCubit, SingupcubitState>(
      listener: (context, state) {
        if (state is SingupcubitSuccess) {}
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

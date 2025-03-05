import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruites_hup/core/services/getit_services.dart';
import 'package:fruites_hup/core/widgets/custom_app_bar.dart';
import 'package:fruites_hup/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruites_hup/features/authentication/presentation/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/CoustomsingupblocConsuomer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context, title: 'حساب جديد'),
      body: BlocProvider(
        create: (context) => SingupcubitCubit(getIt<AuthRepo>()),
        child: CoustomsingupblocConsuomer(),
      ),
    );
  }
}

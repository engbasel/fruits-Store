import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruites_hup/core/services/getit_services.dart';
import 'package:fruites_hup/core/widgets/custom_app_bar.dart';
import 'package:fruites_hup/features/authentication/domain/repo/auth_repo.dart';
import 'package:fruites_hup/features/authentication/presentation/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruites_hup/features/authentication/presentation/widgets/custom_signIn_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل دخول'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SingincubitCubit(getIt<AuthRepo>()),
          child: CustomSignInBlocConsumer(),
        ),
      ),
    );
  }
}

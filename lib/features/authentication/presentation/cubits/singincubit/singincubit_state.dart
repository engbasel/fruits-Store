part of 'singincubit_cubit.dart';

@immutable
abstract class SingincubitState {
  const SingincubitState();

  @override
  List<Object> get props => [];
}

class SingincubitInitial extends SingincubitState {}

class SingincubitLoading extends SingincubitState {}

class SignInCubitSuccessfully extends SingincubitState {
  final UserEntity userEntity;

  const SignInCubitSuccessfully.AuthenticationSuccessState(
      {required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}

class SingincubitFailure extends SingincubitState {
  final String errorMessage;

  const SingincubitFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

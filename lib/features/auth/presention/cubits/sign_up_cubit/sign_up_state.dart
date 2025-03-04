part of 'sign_up_cubit.dart';

@immutable
abstract class SingupcubitState {}

class SingupcubitInitial extends SingupcubitState {}

class SingupcubitSuccess extends SingupcubitState {
  final UserEntity userEntity;
  SingupcubitSuccess({required this.userEntity});
}

class SingupcubitLoading extends SingupcubitState {}

class SingupcubitError extends SingupcubitState {
  final String errorMessage;
  SingupcubitError({required this.errorMessage});
}

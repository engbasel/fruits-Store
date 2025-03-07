import 'package:bloc/bloc.dart';
import 'package:fruites_hup/features/authentication/domain/entity/UserEntity.dart';
import 'package:fruites_hup/features/authentication/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'singincubit_state.dart';

class SingincubitCubit extends Cubit<SingincubitState> {
  SingincubitCubit(this.authRepo) : super(SingincubitInitial());
  final AuthRepo authRepo;

  Future<void> LoginWithEmailAndPassword(
    String email,
    String password,
    // String name,
  ) async {
    emit(SingincubitLoading());
    final result = await authRepo.LoginWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SingincubitFailure(errorMessage: failure.message)),
      (user) => emit(
          SignInCubitSuccessfully.AuthenticationSuccessState(userEntity: user)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SingincubitLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SingincubitFailure(errorMessage: failure.message)),
      (user) => emit(
          SignInCubitSuccessfully.AuthenticationSuccessState(userEntity: user)),
    );
  }
}

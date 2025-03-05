import 'package:bloc/bloc.dart';
import 'package:fruites_hup/features/auth/domain/entity/UserEntity.dart';
import 'package:fruites_hup/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SingupcubitCubit extends Cubit<SingupcubitState> {
  SingupcubitCubit(this.authRepo) : super(SingupcubitInitial());
  final AuthRepo authRepo;
  Future<void> createAccountWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SingupcubitLoading());
    final result =
        await authRepo.CreateaccountWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SingupcubitFailure(errorMessage: failure.message)),
      (user) => emit(SingupcubitSuccess(userEntity: user)),
    );
  }
}

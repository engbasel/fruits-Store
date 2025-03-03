import 'package:dartz/dartz.dart';
import 'package:fruites_hup/core/errors/Flauier.dart';
import 'package:fruites_hup/features/auth/domain/entity/UserEntity.dart';
import 'package:fruites_hup/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImplem extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) {
    throw UnimplementedError();
  }
}

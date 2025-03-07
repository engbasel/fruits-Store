import 'package:dartz/dartz.dart';
import 'package:fruites_hup/core/errors/Flauier.dart';
import 'package:fruites_hup/features/authentication/domain/entity/UserEntity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> CreateaccountWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failure, UserEntity>> LoginWithEmailAndPassword(
      String email, String password);

  Future<Either<Failure, UserEntity>> signInWithGoogle();
  // Future<Either<Failure, UserEntity>> signInWithFacebook(
  //     String facebookAccessToken);
  // Future<Either<Failure, UserEntity>> signInWithApple(String appleIdToken);
  // Future<Either<Failure, UserEntity>> signInWithGitHub(
  //     String githubAccessToken);
}

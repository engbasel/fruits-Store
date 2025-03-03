import 'package:dartz/dartz.dart';
import 'package:fruites_hup/core/errors/Flauier.dart';
import 'package:fruites_hup/features/auth/domain/entity/UserEntity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  // Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
  //     String email, String password);

  // Future<Either<Failure, UserEntity>> signInWithGoogle(String googleIdToken);
  // Future<Either<Failure, UserEntity>> signInWithFacebook(
  //     String facebookAccessToken);
  // Future<Either<Failure, UserEntity>> signInWithApple(String appleIdToken);
  // Future<Either<Failure, UserEntity>> signInWithGitHub(
  //     String githubAccessToken);
}

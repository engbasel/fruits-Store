import 'package:dartz/dartz.dart';
import 'package:fruites_hup/core/errors/Flauier.dart';
import 'package:fruites_hup/core/services/Firebase_Auth_Service.dart';
import 'package:fruites_hup/features/authentication/data/model/userModel.dart';
import 'package:fruites_hup/features/authentication/domain/entity/UserEntity.dart';
import 'package:fruites_hup/features/authentication/domain/repo/auth_repo.dart';

class AuthRepoImplem extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImplem({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> CreateaccountWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var result = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(
        Usermodel.firebase(
          result!,
        ),
      );
    } on Exception catch (e) {
      return Left(ServerFailure('Failed to create user: ${e.toString()}'));
    } catch (e) {
      return Left(ServerFailure('An unknown error occurred.'));
    }
  }
}

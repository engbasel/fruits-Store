import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruites_hup/core/errors/Flauier.dart';
import 'package:fruites_hup/core/services/Firebase_Auth_Service.dart';
import 'package:fruites_hup/features/authentication/data/model/userModel.dart';
import 'package:fruites_hup/features/authentication/domain/entity/UserEntity.dart';
import 'package:fruites_hup/features/authentication/domain/repo/auth_repo.dart';

class AuthRepoImplem extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImplem({required this.firebaseAuthService});

  /// Create an account using email & password
  @override
  Future<Either<Failure, UserEntity>> CreateaccountWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var result = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(
        Usermodel.firebase(
          result!,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebaseAuthError(e));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير معروف أثناء إنشاء الحساب.'));
    }
  }

  /// Login using email & password
  @override
  Future<Either<Failure, UserEntity>> LoginWithEmailAndPassword(
      String email, String password) async {
    try {
      var result = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(
        Usermodel.firebase(
          result!,
        ),
      );
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebaseAuthError(e));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير معروف أثناء تسجيل الدخول.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      UserCredential result = await firebaseAuthService.signInWithGoogle();
      if (result.user == null) {
        return Left(ServerFailure('فشل تسجيل الدخول باستخدام جوجل.'));
      }
      return Right(Usermodel.firebase(result.user!));
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure.fromFirebaseAuthError(e));
    } catch (e) {
      return Left(
          ServerFailure('حدث خطأ غير معروف أثناء تسجيل الدخول بواسطة جوجل.'));
    }
  }
}

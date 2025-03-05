import 'package:fruites_hup/core/services/Firebase_Auth_Service.dart';
import 'package:fruites_hup/features/authentication/data/repo/auth_repo_implem.dart';
import 'package:fruites_hup/features/authentication/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void sutepGetit() {
  // Arrange
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
      AuthRepoImplem(firebaseAuthService: getIt()));
}

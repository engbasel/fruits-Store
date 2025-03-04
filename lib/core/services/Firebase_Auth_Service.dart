import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruites_hup/core/errors/FirebaseAuthCustomException.dart';

class FirebaseAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthCustomException.fromCode(e.code);
    } catch (e) {
      throw FirebaseAuthCustomException('An unknown error occurred.');
    }
  }
}

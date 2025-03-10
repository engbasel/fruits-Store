import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fruites_hup/core/errors/FirebaseAuthCustomException.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Get the currently signed-in user
  User? get currentUser => _auth.currentUser;

  /// Listen for authentication state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Create a new user with email & password
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
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

  /// Sign in with email & password
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
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

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw FirebaseAuthCustomException('تم إلغاء تسجيل الدخول باستخدام جوجل.');
    }

    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  /// Send a password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthCustomException.fromCode(e.code);
    } catch (e) {
      throw FirebaseAuthCustomException('An unknown error occurred.');
    }
  }

  /// Send email verification
  Future<void> sendEmailVerification() async {
    try {
      if (_auth.currentUser != null && !_auth.currentUser!.emailVerified) {
        await _auth.currentUser!.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthCustomException.fromCode(e.code);
    } catch (e) {
      throw FirebaseAuthCustomException('An unknown error occurred.');
    }
  }

  /// Update user profile (name and photo URL)
  Future<void> updateUserProfile(
      {String? displayName, String? photoURL}) async {
    try {
      if (_auth.currentUser != null) {
        await _auth.currentUser!.updateDisplayName(displayName);
        await _auth.currentUser!.updatePhotoURL(photoURL);
        await _auth.currentUser!.reload();
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthCustomException.fromCode(e.code);
    } catch (e) {
      throw FirebaseAuthCustomException('An unknown error occurred.');
    }
  }

  /// Delete user account
  Future<void> deleteUser() async {
    try {
      if (_auth.currentUser != null) {
        await _auth.currentUser!.delete();
      }
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthCustomException.fromCode(e.code);
    } catch (e) {
      throw FirebaseAuthCustomException('An unknown error occurred.');
    }
  }

  /// Sign out user
  Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
    } catch (e) {
      throw FirebaseAuthCustomException('Error signing out.');
    }
  }
}

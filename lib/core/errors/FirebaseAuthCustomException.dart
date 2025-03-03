class FirebaseAuthCustomException implements Exception {
  final String message;

  FirebaseAuthCustomException(this.message);

  factory FirebaseAuthCustomException.fromCode(String code) {
    switch (code) {
      case 'weak-password':
        return FirebaseAuthCustomException(
            'The password provided is too weak.');
      case 'email-already-in-use':
        return FirebaseAuthCustomException(
            'The account already exists for that email.');
      case 'invalid-email':
        return FirebaseAuthCustomException('The email address is not valid.');
      case 'operation-not-allowed':
        return FirebaseAuthCustomException(
            'Email/password accounts are not enabled.');
      default:
        return FirebaseAuthCustomException('An unknown error occurred.');
    }
  }

  @override
  String toString() => message;
}

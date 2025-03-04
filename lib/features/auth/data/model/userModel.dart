import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruites_hup/features/auth/domain/entity/UserEntity.dart';

class Usermodel extends UserEntity {
  Usermodel({
    required super.id,
    required super.name,
    required super.email,
  });
  factory Usermodel.firebase(User user) {
    return Usermodel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }
}

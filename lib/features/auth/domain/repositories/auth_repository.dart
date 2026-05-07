import 'package:flutter_patrol_demo/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> signUp({
    required String fullName,
    required String email,
    required String password,
  });

  Future<User> signIn({required String email, required String password});

  Future<void> logout();
  User? getCurrentUser();
}

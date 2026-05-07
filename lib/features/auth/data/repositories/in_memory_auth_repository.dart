import 'package:flutter_patrol_demo/features/auth/domain/entities/user.dart';
import 'package:flutter_patrol_demo/features/auth/domain/repositories/auth_repository.dart';

class AuthException implements Exception {
  AuthException(this.message);

  final String message;
}

class InMemoryAuthRepository implements AuthRepository {
  final Map<String, String> _credentialsByEmail = {};
  final Map<String, String> _nameByEmail = {};
  User? _currentUser;

  @override
  User? getCurrentUser() => _currentUser;

  @override
  Future<User> signIn({required String email, required String password}) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));

    final normalizedEmail = email.trim().toLowerCase();
    final savedPassword = _credentialsByEmail[normalizedEmail];
    final fullName = _nameByEmail[normalizedEmail];

    if (savedPassword == null ||
        savedPassword != password ||
        fullName == null) {
      throw AuthException('Invalid email or password');
    }

    final user = User(fullName: fullName, email: normalizedEmail);
    _currentUser = user;
    return user;
  }

  @override
  Future<User> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));

    final normalizedEmail = email.trim().toLowerCase();
    if (_credentialsByEmail.containsKey(normalizedEmail)) {
      throw AuthException('An account with this email already exists');
    }

    _credentialsByEmail[normalizedEmail] = password;
    _nameByEmail[normalizedEmail] = fullName.trim();
    return User(fullName: fullName.trim(), email: normalizedEmail);
  }

  @override
  Future<void> logout() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _currentUser = null;
  }
}

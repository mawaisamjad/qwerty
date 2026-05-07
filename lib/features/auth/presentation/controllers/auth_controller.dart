import 'package:flutter/foundation.dart';
import 'package:flutter_patrol_demo/features/auth/data/repositories/in_memory_auth_repository.dart';
import 'package:flutter_patrol_demo/features/auth/domain/entities/user.dart';
import 'package:flutter_patrol_demo/features/auth/domain/repositories/auth_repository.dart';

class AuthController extends ChangeNotifier {
  AuthController(this._repository);

  final AuthRepository _repository;

  bool isLoading = false;
  User? currentUser;
  String? lastError;

  Future<bool> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    try {
      await _repository.signUp(
        fullName: fullName,
        email: email,
        password: password,
      );
      lastError = null;
      return true;
    } on AuthException catch (error) {
      lastError = error.message;
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> signIn({required String email, required String password}) async {
    _setLoading(true);
    try {
      currentUser = await _repository.signIn(email: email, password: password);
      lastError = null;
      return true;
    } on AuthException catch (error) {
      lastError = error.message;
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _setLoading(true);
    await _repository.logout();
    currentUser = null;
    _setLoading(false);
  }

  void _setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import '../../data/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;
  UserModel? _user;
  bool _isLoading = false;

  AuthProvider(this._authRepository) {
    _init();
  }

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;

  void _init() {
    _authRepository.onAuthStateChanged.listen((userModel) {
      _user = userModel;
      notifyListeners();
    });
  }

  Future<bool> loginAnonymously() async {
    _setLoading(true);
    try {
      _user = await _authRepository.signInAnonymously();
      return _user != null;
    } catch (e) {
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    await _authRepository.signOut();
    _user = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
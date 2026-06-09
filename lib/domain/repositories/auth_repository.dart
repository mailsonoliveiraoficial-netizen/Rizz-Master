import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> getCurrentUser();
  Future<UserModel?> signInAnonymously();
  Future<void> signOut();
  Stream<UserModel?> get onAuthStateChanged;
}
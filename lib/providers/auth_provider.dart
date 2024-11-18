import 'package:fair_share/services/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProviderClass with ChangeNotifier {
  final FirebaseAuthServices _firebaseAuthServices;
  bool _isLoading = false;

  AuthProviderClass(this._firebaseAuthServices);
  bool get isLoading => _isLoading;

  Future<void> signUp(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _firebaseAuthServices.signUp(email, password);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      await _firebaseAuthServices.signIn(email, password);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

// AVANT : import 'package:firebase_auth/firebase_auth.dart';
// APRÈS :
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabase = Supabase.instance.client;

  // Équivalent de authStateChanges
  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;

  // Équivalent de signIn
  Future<AuthResponse> signIn(String email, String password) async {
    try {
      return await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      throw e.message;
    }
  }

  // Équivalent de register
  Future<AuthResponse> register(String email, String password) async {
    try {
      return await _supabase.auth.signUp(
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
      throw e.message;
    }
  }

  Future<void> signOut() => _supabase.auth.signOut();

  // Équivalent de currentUser
  User? get currentUser => _supabase.auth.currentUser;
}
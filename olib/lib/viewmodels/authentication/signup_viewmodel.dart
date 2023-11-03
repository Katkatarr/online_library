import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class SignupViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signup({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Registrasi berhasil
    } catch (e) {
      // Handle kesalahan saat registrasi
      if (kDebugMode) {
        print('Error during registration: $e');
      }
    }
  }
}

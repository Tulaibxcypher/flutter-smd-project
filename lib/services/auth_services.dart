import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//getting current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

//sign up with email and passwords
  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; //success with no errors
    } on FirebaseAuthException catch (e) {
      //Returning error message
      if (e.code == 'weak-password') {
        return 'Password is too weak';
      } else if (e.code == 'email-in-use') {
        return 'Email already exists';
      } else {
        return e.message ?? 'Sign up failed';
      }
    } catch (e) {
      return 'An error occurred';
    }
  }

//feature for signing in
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; //succes no error
    } on FirebaseAuthException catch (e) {
      //returning error message
      if (e.code == 'user-not-found') {
        return 'No user found with this email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password';
      } else {
        return e.message ?? 'Login failed';
      }
    } catch (e) {
      return 'An error occurred';
    }
  }

//sign out logic
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

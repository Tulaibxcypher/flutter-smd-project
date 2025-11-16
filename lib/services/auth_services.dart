import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Send email verification
  Future<String?> sendEmailVerification() async {
    try {
      User? user = _auth.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        return null; // Success
      }
      return 'User not found';
    } catch (e) {
      return 'Failed to send verification email: $e';
    }
  }

  // Check if email is verified
  Future<bool> isEmailVerified() async {
    User? user = _auth.currentUser;
    await user?.reload(); // Refresh user data
    return user?.emailVerified ?? false;
  }

  // Sign Up with email verification
  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      // Create user account
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Send verification email
      await userCredential.user?.sendEmailVerification();

      return null; // Success - no error
    } on FirebaseAuthException catch (e) {
      print('Firebase Error Code: ${e.code}');
      print('Firebase Error Message: ${e.message}');

      if (e.code == 'weak-password') {
        return 'Password is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'Email already exists';
      } else {
        return e.message ?? 'Sign up failed';
      }
    } catch (e) {
      print('General Error: $e');
      return 'An error occurred: $e';
    }
  }

  // Sign In with email verification check
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if email is verified
      if (!userCredential.user!.emailVerified) {
        await _auth.signOut(); // Sign out unverified user
        return 'Please verify your email before logging in. Check your inbox!';
      }

      return null; // Success
    } on FirebaseAuthException catch (e) {
      print('Firebase Error Code: ${e.code}');
      print('Firebase Error Message: ${e.message}');

      if (e.code == 'user-not-found') {
        return 'No user found with this email';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password';
      } else if (e.code == 'invalid-credential') {
        return 'Invalid email or password';
      } else {
        return e.message ?? 'Login failed';
      }
    } catch (e) {
      print('General Error: $e');
      return 'An error occurred: $e';
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

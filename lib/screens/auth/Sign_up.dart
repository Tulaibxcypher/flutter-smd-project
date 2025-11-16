import 'package:flutter/material.dart';
import 'package:flutter_login/services/auth_services.dart';
import 'package:flutter_login/utilis/constraints.dart';
import 'package:flutter_login/utilis/validators.dart';
import 'package:flutter_login/widgets/custom_button.dart';
import 'package:flutter_login/widgets/custom_text_feild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      final error = await _authService.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      setState(() => _isLoading = false);

      if (error == null) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        // Show error
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: AppConstants.errorColor,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppConstants.paddingLarge),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag,
                    size: 80,
                    color: AppConstants.primaryColor,
                  ),
                  const SizedBox(height: 20),

                  Text(
                    'Create Account',
                    style: AppConstants.headingStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sign up to get started',
                    style: AppConstants.subHeadingStyle,
                  ),
                  const SizedBox(height: 40),

                  CustomTextField(
                    controller: _nameController,
                    hintText: 'Full Name',
                    icon: Icons.person,
                    validator: Validators.validateName,
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email',
                    icon: Icons.email,
                    validator: Validators.validateEmail,
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    icon: Icons.lock,
                    isPassword: true,
                    validator: Validators.validatePassword,
                  ),
                  const SizedBox(height: 16),

                  CustomTextField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    validator: (value) => Validators.validateConfirmPassword(
                      value,
                      _passwordController.text,
                    ),
                  ),
                  const SizedBox(height: 24),

                  CustomButton(
                    text: 'Sign Up',
                    onPressed: _handleSignUp,
                    isLoading: _isLoading,
                  ),
                  const SizedBox(height: 16),

                  //this is for login link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: AppConstants.subHeadingStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Goes back to login
                        },
                        child: Text('Login', style: AppConstants.linkTextStyle),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

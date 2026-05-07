import 'package:flutter/material.dart';
import 'package:flutter_patrol_demo/core/constants/app_keys.dart';
import 'package:flutter_patrol_demo/core/utils/validators.dart';
import 'package:flutter_patrol_demo/features/auth/presentation/controllers/auth_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({required this.controller, super.key});

  static const routeName = '/sign-up';
  final AuthController controller;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final isSuccess = await widget.controller.signUp(
      fullName: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (!mounted) {
      return;
    }

    if (isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account created successfully. Please sign in.'),
        ),
      );
      Navigator.pop(context);
      return;
    }

    final message = widget.controller.lastError ?? 'Unable to sign up';
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, child) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      key: const ValueKey(AppKeys.signUpNameField),
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Full name'),
                      validator: (value) =>
                          Validators.requiredField(value, 'Full name'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      key: const ValueKey(AppKeys.signUpEmailField),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: Validators.email,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      key: const ValueKey(AppKeys.signUpPasswordField),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: Validators.password,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      key: const ValueKey(AppKeys.signUpConfirmPasswordField),
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirm password',
                      ),
                      validator: (value) {
                        final requiredResult = Validators.requiredField(
                          value,
                          'Confirm password',
                        );
                        if (requiredResult != null) {
                          return requiredResult;
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      key: const ValueKey(AppKeys.signUpButton),
                      onPressed: widget.controller.isLoading
                          ? null
                          : _handleSignUp,
                      child: widget.controller.isLoading
                          ? const SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Sign Up'),
                    ),
                    TextButton(
                      key: const ValueKey(AppKeys.goToSignInButton),
                      onPressed: widget.controller.isLoading
                          ? null
                          : () => Navigator.pop(context),
                      child: const Text('Already have an account? Sign in'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_patrol_demo/core/constants/app_keys.dart';
import 'package:flutter_patrol_demo/core/utils/validators.dart';
import 'package:flutter_patrol_demo/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_patrol_demo/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter_patrol_demo/features/home/presentation/screens/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({required this.controller, super.key});

  static const routeName = '/sign-in';
  final AuthController controller;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final isSuccess = await widget.controller.signIn(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (!mounted) {
      return;
    }

    if (isSuccess) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      return;
    }

    final message = widget.controller.lastError ?? 'Unable to sign in';
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
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
                      key: const ValueKey(AppKeys.signInEmailField),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: Validators.email,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      key: const ValueKey(AppKeys.signInPasswordField),
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: Validators.password,
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      key: const ValueKey(AppKeys.signInButton),
                      onPressed: widget.controller.isLoading
                          ? null
                          : _handleSignIn,
                      child: widget.controller.isLoading
                          ? const SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Sign In'),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      key: const ValueKey(AppKeys.goToSignUpButton),
                      onPressed: widget.controller.isLoading
                          ? null
                          : () => Navigator.pushNamed(
                              context,
                              SignUpScreen.routeName,
                            ),
                      child: const Text('Create an account'),
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

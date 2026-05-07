import 'package:flutter/material.dart';
import 'package:flutter_patrol_demo/core/constants/app_keys.dart';
import 'package:flutter_patrol_demo/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_patrol_demo/features/auth/presentation/screens/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.controller, super.key});

  static const routeName = '/home';
  final AuthController controller;

  Future<void> _logout(BuildContext context) async {
    await controller.logout();
    if (!context.mounted) {
      return;
    }
    Navigator.pushNamedAndRemoveUntil(
      context,
      SignInScreen.routeName,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final fullName = controller.currentUser?.fullName ?? 'User';

    return Scaffold(
      key: const ValueKey(AppKeys.homeScreen),
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Welcome, $fullName',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              FilledButton(
                key: const ValueKey(AppKeys.logoutButton),
                onPressed: () => _logout(context),
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_patrol_demo/features/auth/data/repositories/in_memory_auth_repository.dart';
import 'package:flutter_patrol_demo/features/auth/presentation/controllers/auth_controller.dart';
import 'package:flutter_patrol_demo/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:flutter_patrol_demo/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:flutter_patrol_demo/features/home/presentation/screens/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();
    _authController = AuthController(InMemoryAuthRepository());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Patrol Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: SignInScreen.routeName,
      routes: {
        SignInScreen.routeName: (_) =>
            SignInScreen(controller: _authController),
        SignUpScreen.routeName: (_) =>
            SignUpScreen(controller: _authController),
        HomeScreen.routeName: (_) => HomeScreen(controller: _authController),
      },
    );
  }
}

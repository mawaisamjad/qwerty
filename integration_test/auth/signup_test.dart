import 'package:flutter_patrol_demo/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest('Successful sign up', ($) async {
    await $.pumpWidgetAndSettle(const MyApp());

    await $(#goToSignUpButton).tap();
    await $(#fullNameField).enterText('Awais Amjad');
    await $(#signUpEmailField).enterText('awais@example.com');
    await $(#signUpPasswordField).enterText('secret123');
    await $(#confirmPasswordField).enterText('secret123');
    await $(#signUpButton).tap();

    expect($('Account created successfully. Please sign in.'), findsOneWidget);
    expect($(#emailField), findsOneWidget);
  });

  patrolTest('Sign up validation failure', ($) async {
    await $.pumpWidgetAndSettle(const MyApp());

    await $(#goToSignUpButton).tap();
    await $(#signUpButton).tap();

    expect($('Full name is required'), findsOneWidget);
    expect($('Email is required'), findsOneWidget);
    expect($('Password is required'), findsOneWidget);
    expect($('Confirm password is required'), findsOneWidget);
  });
}

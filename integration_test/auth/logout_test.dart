import 'package:flutter_patrol_demo/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest('Logout flow with keyboard and lifecycle checks', ($) async {
    await $.pumpWidgetAndSettle(const MyApp());

    await $(#goToSignUpButton).tap();
    await $(#fullNameField).enterText('Awais Amjad');
    await $(#signUpEmailField).enterText('awais@example.com');
    await $(#signUpPasswordField).enterText('secret123');
    await $(#confirmPasswordField).enterText('secret123');
    await $(#signUpButton).tap();

    await $(#emailField).enterText('awais@example.com');
    await $(#passwordField).enterText('secret123');

    await $(#loginButton).tap();
    await $.pumpAndSettle();
    expect($(#homeScreen), findsOneWidget);

    await $(#logoutButton).tap();
    expect($(#emailField), findsOneWidget);
  });
}

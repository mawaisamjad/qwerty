import 'package:flutter_patrol_demo/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest('App launch smoke test', ($) async {
    await $.pumpWidgetAndSettle(const MyApp());

    expect($(#emailField), findsOneWidget);
    expect($(#passwordField), findsOneWidget);
    expect($(#loginButton), findsOneWidget);
    expect($(#goToSignUpButton), findsOneWidget);
  });
}

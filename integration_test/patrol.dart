import 'package:flutter_patrol_demo/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolSetUp(() {
    // Keep setup hook available for future shared seeding/config.
  });

  patrolTest('App launches to sign in screen', ($) async {
    await $.pumpWidgetAndSettle(const MyApp());
    expect($('Sign In'), findsWidgets);
    expect($(#emailField), findsOneWidget);
  });
}

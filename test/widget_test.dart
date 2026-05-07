import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_patrol_demo/app.dart';

void main() {
  testWidgets('Sign in screen loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Sign In'), findsWidgets);
    expect(find.text('Create an account'), findsOneWidget);
  });
}

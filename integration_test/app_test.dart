import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_with_bloc/main.dart';
import 'package:integration_test/integration_test.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // Grand access to camera with adb, because the Flutter integration test
  // can't interact with native buttons.
  await integrationDriver();
}

integrationDriver() {

  group('end-to-end test', () {
    testWidgets('tap on the incrament button, verify counter',
        (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      // Verify the the app starts on the home page.
      expect(find.text('You have pushed the button this many times:'), findsOneWidget);

      // Finds the incrament button to tap on.
      expect(find.byIcon(Icons.add), findsOneWidget);
      final fab = find.byIcon(Icons.add);

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('3'), findsOneWidget);

      // Verify the the app have the random counter.
      expect(find.text('Your random number is:'), findsOneWidget);

      // Finds the incrament button to tap on.
      expect(find.byIcon(Icons.add_circle), findsOneWidget);
      final rdm = find.byIcon(Icons.add_circle);

      // Emulate a tap on the floating action button.
      await tester.tap(rdm);

      // Trigger a frame.
      await tester.pumpAndSettle();
    });
  });
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_app_1/main.dart';
import 'package:test_app_1/two_digit_operation.dart';

main() {
  group('CalculatorApp', () {
    testWidgets('matches golden files', (tester) async {
      await tester.pumpWidget(CalculatorApp());
      await expectLater(
        find.byType(CalculatorApp),
        matchesGoldenFile('goldens/calculator_app.png'),
      );
    });

    testWidgets('renders four widgets of type TwoDigitOperation',
        (WidgetTester tester) async {
      await tester.pumpWidget(CalculatorApp());
      expect(find.byType(TwoDigitOperation), findsNWidgets(4));
    });
  });

  testWidgets('there are zero buttons in the screen', (tester) async {
    await tester.pumpWidget(CalculatorApp());
    expect(find.byType(ElevatedButton), findsNothing);
  });

  group('add', () {
    testWidgets('shows results when given two number', (tester) async {
      await tester.pumpWidget(CalculatorApp());
      final topTextFieldFinder = find.byKey(Key('textField_top_plus'));
      final bottomTextFieldFinder = find.byKey(Key('textField_bottom_plus'));

      await tester.ensureVisible(topTextFieldFinder);
      await tester.tap(topTextFieldFinder);
      await tester.enterText(topTextFieldFinder, '3');

      await tester.ensureVisible(bottomTextFieldFinder);
      await tester.tap(bottomTextFieldFinder);
      await tester.enterText(bottomTextFieldFinder, '6');

      await tester.pumpAndSettle();
      expect(find.text('is 9.0'), findsOneWidget);
    });
  });
}

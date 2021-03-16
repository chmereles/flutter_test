import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app_1/power_of_two.dart';

import 'two_digit_operation_test.mocks.dart';

void main() {
  Calculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  group('PowerOfTwo', () {
    testWidgets('renders the result provided by the calculator',
        (tester) async {
      when(calculator.powerOfTwo(5))
          .thenAnswer((realInvocation) => Future.value(100));

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PowerOfTwo(calculator: calculator),
        ),
      ));

      await tester.enterText(find.byKey(Key('textField_powerOfTwo')), '5');
      await tester.pumpAndSettle();
      expect(find.text('is 100.0'), findsOneWidget);
    });
  });
}

import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_app_1/operation.dart';
import 'package:test_app_1/two_digit_operation.dart';
import 'package:mockito/annotations.dart';

import 'two_digit_operation_test.mocks.dart';

@GenerateMocks([Calculator])
void main() {
  Calculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  // group('TwoDigitOperation', () {
  //   group('Operation.add', () {
  //     testWidgets('paints the value returned by then calculator',
  //         (tester) async {
  //       // when(calculator.add(3, 1)).thenReturn(25);
  //       when(calculator.divide(3, 0)).thenThrow(Exception('oops'));

  //       await tester.pumpWidget(MaterialApp(
  //         home: Scaffold(
  //           body: TwoDigitOperation(
  //             operation: Operation.add,
  //             calculator: calculator,
  //           ),
  //         ),
  //       ));

  //       await tester.enterText(
  //         find.byKey(const Key('textField_top_divided by')),
  //         '3',
  //       );

  //       await tester.enterText(
  //         find.byKey(const Key('textField_bottom_divided by')),
  //         '0',
  //       );
  //       await tester.pumpAndSettle();
  //       expect(find.text('is ???'), findsOneWidget);
  //     });
  //   });
  // });

  group('TwoDigitOperation', () {
    group('Operation.add', () {
      testWidgets('paints 4.0 when adding 3 and 1', (tester) async {
        when(calculator.add(3, 1)).thenReturn(4);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TwoDigitOperation(
                operation: Operation.add,
                calculator: calculator,
              ),
            ),
          ),
        );
        await tester.enterText(
          find.byKey(const Key('textField_top_plus')),
          '3',
        );
        await tester.enterText(
          find.byKey(const Key('textField_bottom_plus')),
          '1',
        );
        await tester.pumpAndSettle();
        expect(find.text('is 4.0'), findsOneWidget);
        verify(calculator.add(3, 1)).called(1);
      });
    });

    group('Operation.divided', () {
      testWidgets('paints the value returned by then calculator',
          (tester) async {
        // when(calculator.divide(3, 1)).thenReturn(25);
        when(calculator.divide(3, 0)).thenThrow(Exception('oops'));

        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: TwoDigitOperation(
              operation: Operation.divide,
              calculator: calculator,
            ),
          ),
        ));

        await tester.enterText(
          find.byKey(const Key('textField_top_divided by')),
          '3',
        );

        await tester.enterText(
          find.byKey(const Key('textField_bottom_divided by')),
          '1',
        );
        await tester.pumpAndSettle();
        // expect(find.text('is 25.0'), findsOneWidget);
        expect(find.text('is ???'), findsOneWidget);
      });
    });
  });
}

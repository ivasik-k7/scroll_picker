import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scroll_picker/scroll_picker.dart';

void main() {
  testWidgets('NumberScrollPicker initializes with the correct initial value', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NumberScrollPicker(
            initialValue: 3,
            onChanged: (value) {},
            values: const [1, 2, 3, 4, 5],
          ),
        ),
      ),
    );

    // Find the text widget inside the picker.
    final selectedValueFinder = find.text('3');

    // Verify that the text widget displays the initial value.
    expect(selectedValueFinder, findsOneWidget);
  });

  testWidgets('NumberScrollPicker invokes onChanged callback when the value changes', (WidgetTester tester) async {
    int? selectedValue;

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NumberScrollPicker(
            initialValue: 1,
            onChanged: (value) {
              selectedValue = value;
            },
            values: const [1, 2, 3, 4, 5],
          ),
        ),
      ),
    );

    // Simulate scrolling to a new value.
    await tester.fling(find.byType(NumberScrollPicker), const Offset(0, -200), 1000);
    await tester.pump();

    // Verify that the onChanged callback is invoked with the new value.
    expect(selectedValue, 5);
  });
}

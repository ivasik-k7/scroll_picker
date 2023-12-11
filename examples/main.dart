import 'package:flutter/material.dart';
import 'package:scroll_picker/scroll_picker.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Number Scroll Picker Example'),
        ),
        body: Center(
          child: NumberScrollPicker(
            initialValue: 5, // Initial value for the picker
            onChanged: print,
            axis: Axis.vertical, // or Axis.horizontal
            size: 60, // Size of each item
            selectedBoxStyle: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            ),
            unselectedBoxStyle: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
            ),
            selectedTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            unselectedTextStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
            ),
            values: [
              null,
              ...List.generate(10, (index) => index + 1),
            ], // Values to display in the picker
          ),
        ),
      ),
    );
  }
}

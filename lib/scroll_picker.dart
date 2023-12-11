library scroll_picker;

import 'dart:math';
import 'package:flutter/material.dart';

/// A customizable number picker widget that uses a list wheel scroll view
/// to display a series of numbers and allow for selection.
class NumberScrollPicker extends StatefulWidget {
  const NumberScrollPicker({
    Key? key,
    required this.initialValue,
    required this.onChanged,
    this.axis,
    this.size = 40,
    this.selectedBoxStyle,
    this.unselectedBoxStyle,
    this.selectedTextStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    this.unselectedTextStyle = const TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.normal,
    ),
    required this.values,
  }) : super(key: key);

  /// The initial value of the picker.
  final int? initialValue;

  /// A callback function that is called when the selected value changes.
  final ValueChanged<int?> onChanged;

  /// The axis along which the picker scrolls.
  final Axis? axis;

  /// The style of the box that is selected.
  final BoxDecoration? selectedBoxStyle;

  /// The style of the box that is not selected.
  final BoxDecoration? unselectedBoxStyle;

  /// The size of the selected box.
  final double size;

  /// The list of values that the picker displays.
  final List<int?> values;

  /// The style of the text that is displayed inside the selected box.
  final TextStyle? selectedTextStyle;

  /// The style of the text that is displayed inside the not selected box.
  final TextStyle? unselectedTextStyle;

  @override
  State<NumberScrollPicker> createState() => _NumberScrollPickerState();
}

class _NumberScrollPickerState extends State<NumberScrollPicker> {
  // The scroll controller for the list wheel scroll view.
  late FixedExtentScrollController _scrollController;

  // The index of the selected item.
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    // Initialize the selected index based on the initial value.
    selectedIndex = widget.values.indexOf(widget.initialValue);

    // Create and initialize the scroll controller.
    _scrollController = FixedExtentScrollController(initialItem: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    // Create a transform that rotates the list wheel scroll view based on the axis.
    return Transform.rotate(
      angle: widget.axis == Axis.vertical || widget.axis == null ? 0 : -pi / 2,
      child: Center(
        // Wrap the list wheel scroll view in a Center widget to ensure it is centered.
        child: ListWheelScrollView.useDelegate(
          // Configure the list wheel scroll view delegate.
          controller: _scrollController,
          useMagnifier: true,
          clipBehavior: Clip.none,
          physics: const FixedExtentScrollPhysics(),
          perspective: 0.01,
          itemExtent: widget.size,
          onSelectedItemChanged: (int index) {
            setState(() => selectedIndex = index);
            // Update the selected value using the selected index.
            widget.onChanged(widget.values[selectedIndex]);
          },
          childDelegate: ListWheelChildBuilderDelegate(
            // Build the child for each item in the list.
            childCount: widget.values.length,
            builder: (_, index) => _buildItem(index),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(int index) {
    final int? value = widget.values[index];
    final bool isSelected = selectedIndex == index;

    return Container(
      margin: const EdgeInsets.all(5),
      width: widget.size,
      decoration: isSelected ? widget.selectedBoxStyle : widget.unselectedBoxStyle,
      child: Transform.rotate(
        angle: widget.axis == Axis.vertical || widget.axis == null ? 0 : pi / 2,
        child: Center(
          child: Text(
            value?.toString() ?? "-",
            style: isSelected ? widget.selectedTextStyle : widget.unselectedTextStyle,
          ),
        ),
      ),
    );
  }
}

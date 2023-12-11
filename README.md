# Number Scroll Picker

The `NumberScrollPicker` is a Flutter widget that provides a customizable number picker with a list wheel scroll view. It allows users to select a number from a series of values.

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  scroll_picker:
    git:
      url: git://github.com/ivasik-k7/scroll_picker.git
```

Then, run:

```bash
flutter pub get
```

## Usage

Import the package:

```dart
import 'package:scroll_picker/scroll_picker.dart';
```

Use the `NumberScrollPicker` widget in your Flutter app:

```dart
NumberScrollPicker(
  initialValue: 5,
  onChanged: (value) {
    print('Selected value: $value');
  },
  axis: Axis.vertical,
  size: 60,
  selectedBoxStyle: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8.0),
  ),
  unselectedBoxStyle: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(8.0),
  ),
  selectedTextStyle: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),
  unselectedTextStyle: TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.normal,
  ),
  values: List.generate(10, (index) => index + 1),
);
```

### Properties

- `initialValue`: The initial value of the picker.
- `onChanged`: A callback function called when the selected value changes.
- `axis`: The axis along which the picker scrolls (default is `Axis.vertical`).
- `size`: The size of each item in the picker.
- `selectedBoxStyle`: The style of the box when it is selected.
- `unselectedBoxStyle`: The style of the box when it is not selected.
- `selectedTextStyle`: The style of the text inside the selected box.
- `unselectedTextStyle`: The style of the text inside the unselected box.
- `values`: The list of values that the picker displays.

For more information, refer to the [example](example/lib/main.dart) in the `example` folder.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

# 🧩 Custom Widgets for Flutter

This directory contains reusable custom widgets used across the Flutter application. These widgets are designed to enhance consistency, reduce code duplication, and simplify UI development.

---

## 🚀 Getting Started

To use a custom widget, simply import it in your Dart file:  

```dart
import 'package:nourish_app/widgets/custom_button.dart';

// Then use it as you would with any Flutter widget:

CustomButton(
  label: 'Click Me',
  onPressed: () {
    // Your logic here
  },
)
```

---

## 🛠️ Widget Guidelines

- Each widget should be documented with DartDoc comments.
- Provide default values for optional parameters where applicable.
- Use consistent naming conventions: CustomButton, CustomCard, etc.
- Keep widgets self-contained and avoid business logic in UI components.



---

## ✍️ Adding a New Widget

1. Create a new Dart file with a descriptive name, e.g., custom_loading_indicator.dart.
2. Define the widget in that file using standard Flutter practices.
3. Add documentation and example usage in the comments.
4. Optionally, update this README to include your new widget.


---

## 📚 Example Widgets

```dart
// CustomButton
// A styled button with custom theming.

CustomButton(
  label: 'Submit',
  onPressed: handleSubmit,
)

// CustomTextField
// A reusable text field with label and validation support.


CustomTextField(
  labelText: 'Email',
  controller: emailController,
  validator: validateEmail,
)
```

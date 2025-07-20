// main.dart
import 'package:flutter/material.dart';
import 'widgets/utils/horizontaldateselector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal Date Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      home: const DateSelectorDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DateSelectorDemo extends StatelessWidget {
  const DateSelectorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Horizontal Date Picker"),
      ),
      body: Center(
        child: HorizontalDatePicker(
          onDateIncrement: (newDate) {
            debugPrint("Date incremented to: $newDate");
          },
          onDateDecrement: (newDate) {
            debugPrint("Date decremented to: $newDate");
          },
        ),
      ),
    );
  }
}

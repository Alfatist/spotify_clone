import 'package:flutter/material.dart';

//permite que eu adicione configurações no context
extension DarkMode on BuildContext {
  /// para chamar, só basta um context.isDarkMode.
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}

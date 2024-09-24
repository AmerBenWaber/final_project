import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle headline1(BuildContext context) {
    return TextStyle(
      fontSize: 24.0, // حجم عنوان افتراضي
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );
  }

  static TextStyle bodyText(BuildContext context) {
    return TextStyle(
      fontSize: 16.0, // حجم نص افتراضي
      color: Colors.black54,
    );
  }
}
